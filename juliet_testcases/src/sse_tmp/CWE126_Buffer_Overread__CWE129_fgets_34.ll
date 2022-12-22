; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType = type { i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_34_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data3 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  store i32 -1, i32* %data, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !27, metadata !DIExpression()), !dbg !33
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !34
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !36
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !37
  %cmp = icmp ne i8* %call, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !40
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !42
  store i32 %call2, i32* %data, align 4, !dbg !43
  br label %if.end, !dbg !44

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !47
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !48
  store i32 %2, i32* %unionFirst, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !50, metadata !DIExpression()), !dbg !52
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !53
  %3 = load i32, i32* %unionSecond, align 4, !dbg !53
  store i32 %3, i32* %data3, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !54, metadata !DIExpression()), !dbg !59
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !59
  %5 = load i32, i32* %data3, align 4, !dbg !60
  %cmp4 = icmp sge i32 %5, 0, !dbg !62
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !63

if.then5:                                         ; preds = %if.end
  %6 = load i32, i32* %data3, align 4, !dbg !64
  %idxprom = sext i32 %6 to i64, !dbg !66
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !66
  %7 = load i32, i32* %arrayidx, align 4, !dbg !66
  call void @printIntLine(i32 %7), !dbg !67
  br label %if.end7, !dbg !68

if.else6:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_34_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  call void @goodB2G(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__CWE129_fgets_34_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__CWE129_fgets_34_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  store i32 7, i32* %data, align 4, !dbg !101
  %0 = load i32, i32* %data, align 4, !dbg !102
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !103
  store i32 %0, i32* %unionFirst, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !105, metadata !DIExpression()), !dbg !107
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !108
  %1 = load i32, i32* %unionSecond, align 4, !dbg !108
  store i32 %1, i32* %data1, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !109, metadata !DIExpression()), !dbg !111
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !111
  %3 = load i32, i32* %data1, align 4, !dbg !112
  %cmp = icmp sge i32 %3, 0, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !116
  %idxprom = sext i32 %4 to i64, !dbg !118
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !118
  %5 = load i32, i32* %arrayidx, align 4, !dbg !118
  call void @printIntLine(i32 %5), !dbg !119
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data3 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion, metadata !127, metadata !DIExpression()), !dbg !128
  store i32 -1, i32* %data, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !130, metadata !DIExpression()), !dbg !132
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !132
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !135
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !136
  %cmp = icmp ne i8* %call, null, !dbg !137
  br i1 %cmp, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !141
  store i32 %call2, i32* %data, align 4, !dbg !142
  br label %if.end, !dbg !143

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !146
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !147
  store i32 %2, i32* %unionFirst, align 4, !dbg !148
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !149, metadata !DIExpression()), !dbg !151
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_fgets_34_unionType* %myUnion to i32*, !dbg !152
  %3 = load i32, i32* %unionSecond, align 4, !dbg !152
  store i32 %3, i32* %data3, align 4, !dbg !151
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !153, metadata !DIExpression()), !dbg !155
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !155
  %5 = load i32, i32* %data3, align 4, !dbg !156
  %cmp4 = icmp sge i32 %5, 0, !dbg !158
  br i1 %cmp4, label %land.lhs.true, label %if.else7, !dbg !159

land.lhs.true:                                    ; preds = %if.end
  %6 = load i32, i32* %data3, align 4, !dbg !160
  %cmp5 = icmp slt i32 %6, 10, !dbg !161
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !162

if.then6:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data3, align 4, !dbg !163
  %idxprom = sext i32 %7 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !165
  %8 = load i32, i32* %arrayidx, align 4, !dbg !165
  call void @printIntLine(i32 %8), !dbg !166
  br label %if.end8, !dbg !167

if.else7:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !168
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_34_bad", scope: !13, file: !13, line: 30, type: !14, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_34.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 32, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 32, column: 9, scope: !12)
!19 = !DILocalVariable(name: "myUnion", scope: !12, file: !13, line: 33, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__CWE129_fgets_34_unionType", file: !13, line: 26, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !13, line: 22, size: 32, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !13, line: 24, baseType: !17, size: 32)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !13, line: 25, baseType: !17, size: 32)
!25 = !DILocation(line: 33, column: 55, scope: !12)
!26 = !DILocation(line: 35, column: 10, scope: !12)
!27 = !DILocalVariable(name: "inputBuffer", scope: !28, file: !13, line: 37, type: !29)
!28 = distinct !DILexicalBlock(scope: !12, file: !13, line: 36, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 112, elements: !31)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !{!32}
!32 = !DISubrange(count: 14)
!33 = !DILocation(line: 37, column: 14, scope: !28)
!34 = !DILocation(line: 39, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !13, line: 39, column: 13)
!36 = !DILocation(line: 39, column: 49, scope: !35)
!37 = !DILocation(line: 39, column: 13, scope: !35)
!38 = !DILocation(line: 39, column: 56, scope: !35)
!39 = !DILocation(line: 39, column: 13, scope: !28)
!40 = !DILocation(line: 42, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !13, line: 40, column: 9)
!42 = !DILocation(line: 42, column: 20, scope: !41)
!43 = !DILocation(line: 42, column: 18, scope: !41)
!44 = !DILocation(line: 43, column: 9, scope: !41)
!45 = !DILocation(line: 46, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !13, line: 45, column: 9)
!47 = !DILocation(line: 49, column: 26, scope: !12)
!48 = !DILocation(line: 49, column: 13, scope: !12)
!49 = !DILocation(line: 49, column: 24, scope: !12)
!50 = !DILocalVariable(name: "data", scope: !51, file: !13, line: 51, type: !17)
!51 = distinct !DILexicalBlock(scope: !12, file: !13, line: 50, column: 5)
!52 = !DILocation(line: 51, column: 13, scope: !51)
!53 = !DILocation(line: 51, column: 28, scope: !51)
!54 = !DILocalVariable(name: "buffer", scope: !55, file: !13, line: 53, type: !56)
!55 = distinct !DILexicalBlock(scope: !51, file: !13, line: 52, column: 9)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 10)
!59 = !DILocation(line: 53, column: 17, scope: !55)
!60 = !DILocation(line: 56, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !13, line: 56, column: 17)
!62 = !DILocation(line: 56, column: 22, scope: !61)
!63 = !DILocation(line: 56, column: 17, scope: !55)
!64 = !DILocation(line: 58, column: 37, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !13, line: 57, column: 13)
!66 = !DILocation(line: 58, column: 30, scope: !65)
!67 = !DILocation(line: 58, column: 17, scope: !65)
!68 = !DILocation(line: 59, column: 13, scope: !65)
!69 = !DILocation(line: 62, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !61, file: !13, line: 61, column: 13)
!71 = !DILocation(line: 66, column: 1, scope: !12)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_34_good", scope: !13, file: !13, line: 139, type: !14, scopeLine: 140, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 141, column: 5, scope: !72)
!74 = !DILocation(line: 142, column: 5, scope: !72)
!75 = !DILocation(line: 143, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 153, type: !77, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!17, !17, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !13, line: 153, type: !17)
!82 = !DILocation(line: 153, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !13, line: 153, type: !79)
!84 = !DILocation(line: 153, column: 27, scope: !76)
!85 = !DILocation(line: 156, column: 22, scope: !76)
!86 = !DILocation(line: 156, column: 12, scope: !76)
!87 = !DILocation(line: 156, column: 5, scope: !76)
!88 = !DILocation(line: 158, column: 5, scope: !76)
!89 = !DILocation(line: 159, column: 5, scope: !76)
!90 = !DILocation(line: 160, column: 5, scope: !76)
!91 = !DILocation(line: 163, column: 5, scope: !76)
!92 = !DILocation(line: 164, column: 5, scope: !76)
!93 = !DILocation(line: 165, column: 5, scope: !76)
!94 = !DILocation(line: 167, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 73, type: !14, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !13, line: 75, type: !17)
!97 = !DILocation(line: 75, column: 9, scope: !95)
!98 = !DILocalVariable(name: "myUnion", scope: !95, file: !13, line: 76, type: !20)
!99 = !DILocation(line: 76, column: 55, scope: !95)
!100 = !DILocation(line: 78, column: 10, scope: !95)
!101 = !DILocation(line: 81, column: 10, scope: !95)
!102 = !DILocation(line: 82, column: 26, scope: !95)
!103 = !DILocation(line: 82, column: 13, scope: !95)
!104 = !DILocation(line: 82, column: 24, scope: !95)
!105 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 84, type: !17)
!106 = distinct !DILexicalBlock(scope: !95, file: !13, line: 83, column: 5)
!107 = !DILocation(line: 84, column: 13, scope: !106)
!108 = !DILocation(line: 84, column: 28, scope: !106)
!109 = !DILocalVariable(name: "buffer", scope: !110, file: !13, line: 86, type: !56)
!110 = distinct !DILexicalBlock(scope: !106, file: !13, line: 85, column: 9)
!111 = !DILocation(line: 86, column: 17, scope: !110)
!112 = !DILocation(line: 89, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !13, line: 89, column: 17)
!114 = !DILocation(line: 89, column: 22, scope: !113)
!115 = !DILocation(line: 89, column: 17, scope: !110)
!116 = !DILocation(line: 91, column: 37, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !13, line: 90, column: 13)
!118 = !DILocation(line: 91, column: 30, scope: !117)
!119 = !DILocation(line: 91, column: 17, scope: !117)
!120 = !DILocation(line: 92, column: 13, scope: !117)
!121 = !DILocation(line: 95, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !113, file: !13, line: 94, column: 13)
!123 = !DILocation(line: 99, column: 1, scope: !95)
!124 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 102, type: !14, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !13, line: 104, type: !17)
!126 = !DILocation(line: 104, column: 9, scope: !124)
!127 = !DILocalVariable(name: "myUnion", scope: !124, file: !13, line: 105, type: !20)
!128 = !DILocation(line: 105, column: 55, scope: !124)
!129 = !DILocation(line: 107, column: 10, scope: !124)
!130 = !DILocalVariable(name: "inputBuffer", scope: !131, file: !13, line: 109, type: !29)
!131 = distinct !DILexicalBlock(scope: !124, file: !13, line: 108, column: 5)
!132 = !DILocation(line: 109, column: 14, scope: !131)
!133 = !DILocation(line: 111, column: 19, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !13, line: 111, column: 13)
!135 = !DILocation(line: 111, column: 49, scope: !134)
!136 = !DILocation(line: 111, column: 13, scope: !134)
!137 = !DILocation(line: 111, column: 56, scope: !134)
!138 = !DILocation(line: 111, column: 13, scope: !131)
!139 = !DILocation(line: 114, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !13, line: 112, column: 9)
!141 = !DILocation(line: 114, column: 20, scope: !140)
!142 = !DILocation(line: 114, column: 18, scope: !140)
!143 = !DILocation(line: 115, column: 9, scope: !140)
!144 = !DILocation(line: 118, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !134, file: !13, line: 117, column: 9)
!146 = !DILocation(line: 121, column: 26, scope: !124)
!147 = !DILocation(line: 121, column: 13, scope: !124)
!148 = !DILocation(line: 121, column: 24, scope: !124)
!149 = !DILocalVariable(name: "data", scope: !150, file: !13, line: 123, type: !17)
!150 = distinct !DILexicalBlock(scope: !124, file: !13, line: 122, column: 5)
!151 = !DILocation(line: 123, column: 13, scope: !150)
!152 = !DILocation(line: 123, column: 28, scope: !150)
!153 = !DILocalVariable(name: "buffer", scope: !154, file: !13, line: 125, type: !56)
!154 = distinct !DILexicalBlock(scope: !150, file: !13, line: 124, column: 9)
!155 = !DILocation(line: 125, column: 17, scope: !154)
!156 = !DILocation(line: 127, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !13, line: 127, column: 17)
!158 = !DILocation(line: 127, column: 22, scope: !157)
!159 = !DILocation(line: 127, column: 27, scope: !157)
!160 = !DILocation(line: 127, column: 30, scope: !157)
!161 = !DILocation(line: 127, column: 35, scope: !157)
!162 = !DILocation(line: 127, column: 17, scope: !154)
!163 = !DILocation(line: 129, column: 37, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !13, line: 128, column: 13)
!165 = !DILocation(line: 129, column: 30, scope: !164)
!166 = !DILocation(line: 129, column: 17, scope: !164)
!167 = !DILocation(line: 130, column: 13, scope: !164)
!168 = !DILocation(line: 133, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !157, file: !13, line: 132, column: 13)
!170 = !DILocation(line: 137, column: 1, scope: !124)
