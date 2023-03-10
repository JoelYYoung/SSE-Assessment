; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_31.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_31_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data3 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !20, metadata !DIExpression()), !dbg !26
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !27
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !29
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !30
  %cmp = icmp ne i8* %call, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !35
  store i32 %call2, i32* %data, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !40, metadata !DIExpression()), !dbg !42
  %2 = load i32, i32* %data, align 4, !dbg !43
  store i32 %2, i32* %dataCopy, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !44, metadata !DIExpression()), !dbg !45
  %3 = load i32, i32* %dataCopy, align 4, !dbg !46
  store i32 %3, i32* %data3, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !47, metadata !DIExpression()), !dbg !52
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !52
  %5 = load i32, i32* %data3, align 4, !dbg !53
  %cmp4 = icmp slt i32 %5, 10, !dbg !55
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !56

if.then5:                                         ; preds = %if.end
  %6 = load i32, i32* %data3, align 4, !dbg !57
  %idxprom = sext i32 %6 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !59
  %7 = load i32, i32* %arrayidx, align 4, !dbg !59
  call void @printIntLine(i32 %7), !dbg !60
  br label %if.end7, !dbg !61

if.else6:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !64
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
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_31_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  call void @goodB2G(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #7, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #7, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__CWE839_fgets_31_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__CWE839_fgets_31_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 -1, i32* %data, align 4, !dbg !91
  store i32 7, i32* %data, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = load i32, i32* %data, align 4, !dbg !96
  store i32 %0, i32* %dataCopy, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !97, metadata !DIExpression()), !dbg !98
  %1 = load i32, i32* %dataCopy, align 4, !dbg !99
  store i32 %1, i32* %data1, align 4, !dbg !98
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !100, metadata !DIExpression()), !dbg !102
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !102
  %3 = load i32, i32* %data1, align 4, !dbg !103
  %cmp = icmp slt i32 %3, 10, !dbg !105
  br i1 %cmp, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !107
  %idxprom = sext i32 %4 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !109
  %5 = load i32, i32* %arrayidx, align 4, !dbg !109
  call void @printIntLine(i32 %5), !dbg !110
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !115 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data3 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %data, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !119, metadata !DIExpression()), !dbg !121
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !121
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !122
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !124
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !125
  %cmp = icmp ne i8* %call, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.else, !dbg !127

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !128
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !130
  store i32 %call2, i32* %data, align 4, !dbg !131
  br label %if.end, !dbg !132

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !135, metadata !DIExpression()), !dbg !137
  %2 = load i32, i32* %data, align 4, !dbg !138
  store i32 %2, i32* %dataCopy, align 4, !dbg !137
  call void @llvm.dbg.declare(metadata i32* %data3, metadata !139, metadata !DIExpression()), !dbg !140
  %3 = load i32, i32* %dataCopy, align 4, !dbg !141
  store i32 %3, i32* %data3, align 4, !dbg !140
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !142, metadata !DIExpression()), !dbg !144
  %4 = bitcast [10 x i32]* %buffer to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !144
  %5 = load i32, i32* %data3, align 4, !dbg !145
  %cmp4 = icmp sge i32 %5, 0, !dbg !147
  br i1 %cmp4, label %land.lhs.true, label %if.else7, !dbg !148

land.lhs.true:                                    ; preds = %if.end
  %6 = load i32, i32* %data3, align 4, !dbg !149
  %cmp5 = icmp slt i32 %6, 10, !dbg !150
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !151

if.then6:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %data3, align 4, !dbg !152
  %idxprom = sext i32 %7 to i64, !dbg !154
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !154
  %8 = load i32, i32* %arrayidx, align 4, !dbg !154
  call void @printIntLine(i32 %8), !dbg !155
  br label %if.end8, !dbg !156

if.else7:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !157
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  ret void, !dbg !159
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_31_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_31.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 30, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 30, column: 14, scope: !21)
!27 = !DILocation(line: 32, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 32, column: 13)
!29 = !DILocation(line: 32, column: 49, scope: !28)
!30 = !DILocation(line: 32, column: 13, scope: !28)
!31 = !DILocation(line: 32, column: 56, scope: !28)
!32 = !DILocation(line: 32, column: 13, scope: !21)
!33 = !DILocation(line: 35, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 33, column: 9)
!35 = !DILocation(line: 35, column: 20, scope: !34)
!36 = !DILocation(line: 35, column: 18, scope: !34)
!37 = !DILocation(line: 36, column: 9, scope: !34)
!38 = !DILocation(line: 39, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 38, column: 9)
!40 = !DILocalVariable(name: "dataCopy", scope: !41, file: !13, line: 43, type: !17)
!41 = distinct !DILexicalBlock(scope: !12, file: !13, line: 42, column: 5)
!42 = !DILocation(line: 43, column: 13, scope: !41)
!43 = !DILocation(line: 43, column: 24, scope: !41)
!44 = !DILocalVariable(name: "data", scope: !41, file: !13, line: 44, type: !17)
!45 = !DILocation(line: 44, column: 13, scope: !41)
!46 = !DILocation(line: 44, column: 20, scope: !41)
!47 = !DILocalVariable(name: "buffer", scope: !48, file: !13, line: 46, type: !49)
!48 = distinct !DILexicalBlock(scope: !41, file: !13, line: 45, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 10)
!52 = !DILocation(line: 46, column: 17, scope: !48)
!53 = !DILocation(line: 49, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !13, line: 49, column: 17)
!55 = !DILocation(line: 49, column: 22, scope: !54)
!56 = !DILocation(line: 49, column: 17, scope: !48)
!57 = !DILocation(line: 51, column: 37, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !13, line: 50, column: 13)
!59 = !DILocation(line: 51, column: 30, scope: !58)
!60 = !DILocation(line: 51, column: 17, scope: !58)
!61 = !DILocation(line: 52, column: 13, scope: !58)
!62 = !DILocation(line: 55, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !54, file: !13, line: 54, column: 13)
!64 = !DILocation(line: 59, column: 1, scope: !12)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_31_good", scope: !13, file: !13, line: 130, type: !14, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 132, column: 5, scope: !65)
!67 = !DILocation(line: 133, column: 5, scope: !65)
!68 = !DILocation(line: 134, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 144, type: !70, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!17, !17, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !13, line: 144, type: !17)
!75 = !DILocation(line: 144, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !13, line: 144, type: !72)
!77 = !DILocation(line: 144, column: 27, scope: !69)
!78 = !DILocation(line: 147, column: 22, scope: !69)
!79 = !DILocation(line: 147, column: 12, scope: !69)
!80 = !DILocation(line: 147, column: 5, scope: !69)
!81 = !DILocation(line: 149, column: 5, scope: !69)
!82 = !DILocation(line: 150, column: 5, scope: !69)
!83 = !DILocation(line: 151, column: 5, scope: !69)
!84 = !DILocation(line: 154, column: 5, scope: !69)
!85 = !DILocation(line: 155, column: 5, scope: !69)
!86 = !DILocation(line: 156, column: 5, scope: !69)
!87 = !DILocation(line: 158, column: 5, scope: !69)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 66, type: !14, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !13, line: 68, type: !17)
!90 = !DILocation(line: 68, column: 9, scope: !88)
!91 = !DILocation(line: 70, column: 10, scope: !88)
!92 = !DILocation(line: 73, column: 10, scope: !88)
!93 = !DILocalVariable(name: "dataCopy", scope: !94, file: !13, line: 75, type: !17)
!94 = distinct !DILexicalBlock(scope: !88, file: !13, line: 74, column: 5)
!95 = !DILocation(line: 75, column: 13, scope: !94)
!96 = !DILocation(line: 75, column: 24, scope: !94)
!97 = !DILocalVariable(name: "data", scope: !94, file: !13, line: 76, type: !17)
!98 = !DILocation(line: 76, column: 13, scope: !94)
!99 = !DILocation(line: 76, column: 20, scope: !94)
!100 = !DILocalVariable(name: "buffer", scope: !101, file: !13, line: 78, type: !49)
!101 = distinct !DILexicalBlock(scope: !94, file: !13, line: 77, column: 9)
!102 = !DILocation(line: 78, column: 17, scope: !101)
!103 = !DILocation(line: 81, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !13, line: 81, column: 17)
!105 = !DILocation(line: 81, column: 22, scope: !104)
!106 = !DILocation(line: 81, column: 17, scope: !101)
!107 = !DILocation(line: 83, column: 37, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !13, line: 82, column: 13)
!109 = !DILocation(line: 83, column: 30, scope: !108)
!110 = !DILocation(line: 83, column: 17, scope: !108)
!111 = !DILocation(line: 84, column: 13, scope: !108)
!112 = !DILocation(line: 87, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !13, line: 86, column: 13)
!114 = !DILocation(line: 91, column: 1, scope: !88)
!115 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 94, type: !14, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !13, line: 96, type: !17)
!117 = !DILocation(line: 96, column: 9, scope: !115)
!118 = !DILocation(line: 98, column: 10, scope: !115)
!119 = !DILocalVariable(name: "inputBuffer", scope: !120, file: !13, line: 100, type: !22)
!120 = distinct !DILexicalBlock(scope: !115, file: !13, line: 99, column: 5)
!121 = !DILocation(line: 100, column: 14, scope: !120)
!122 = !DILocation(line: 102, column: 19, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !13, line: 102, column: 13)
!124 = !DILocation(line: 102, column: 49, scope: !123)
!125 = !DILocation(line: 102, column: 13, scope: !123)
!126 = !DILocation(line: 102, column: 56, scope: !123)
!127 = !DILocation(line: 102, column: 13, scope: !120)
!128 = !DILocation(line: 105, column: 25, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !13, line: 103, column: 9)
!130 = !DILocation(line: 105, column: 20, scope: !129)
!131 = !DILocation(line: 105, column: 18, scope: !129)
!132 = !DILocation(line: 106, column: 9, scope: !129)
!133 = !DILocation(line: 109, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !123, file: !13, line: 108, column: 9)
!135 = !DILocalVariable(name: "dataCopy", scope: !136, file: !13, line: 113, type: !17)
!136 = distinct !DILexicalBlock(scope: !115, file: !13, line: 112, column: 5)
!137 = !DILocation(line: 113, column: 13, scope: !136)
!138 = !DILocation(line: 113, column: 24, scope: !136)
!139 = !DILocalVariable(name: "data", scope: !136, file: !13, line: 114, type: !17)
!140 = !DILocation(line: 114, column: 13, scope: !136)
!141 = !DILocation(line: 114, column: 20, scope: !136)
!142 = !DILocalVariable(name: "buffer", scope: !143, file: !13, line: 116, type: !49)
!143 = distinct !DILexicalBlock(scope: !136, file: !13, line: 115, column: 9)
!144 = !DILocation(line: 116, column: 17, scope: !143)
!145 = !DILocation(line: 118, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !13, line: 118, column: 17)
!147 = !DILocation(line: 118, column: 22, scope: !146)
!148 = !DILocation(line: 118, column: 27, scope: !146)
!149 = !DILocation(line: 118, column: 30, scope: !146)
!150 = !DILocation(line: 118, column: 35, scope: !146)
!151 = !DILocation(line: 118, column: 17, scope: !143)
!152 = !DILocation(line: 120, column: 37, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !13, line: 119, column: 13)
!154 = !DILocation(line: 120, column: 30, scope: !153)
!155 = !DILocation(line: 120, column: 17, scope: !153)
!156 = !DILocation(line: 121, column: 13, scope: !153)
!157 = !DILocation(line: 124, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !146, file: !13, line: 123, column: 13)
!159 = !DILocation(line: 128, column: 1, scope: !115)
