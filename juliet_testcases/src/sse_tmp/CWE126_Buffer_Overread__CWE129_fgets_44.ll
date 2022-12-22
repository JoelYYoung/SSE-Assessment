; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_44_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !25, metadata !DIExpression()), !dbg !31
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !31
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !32
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !34
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !35
  %cmp = icmp ne i8* %call, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !40
  store i32 %call2, i32* %data, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !45
  %3 = load i32, i32* %data, align 4, !dbg !46
  call void %2(i32 %3), !dbg !45
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !51, metadata !DIExpression()), !dbg !56
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !56
  %1 = load i32, i32* %data.addr, align 4, !dbg !57
  %cmp = icmp sge i32 %1, 0, !dbg !59
  br i1 %cmp, label %if.then, label %if.else, !dbg !60

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !61
  %idxprom = sext i32 %2 to i64, !dbg !63
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !63
  %3 = load i32, i32* %arrayidx, align 4, !dbg !63
  call void @printIntLine(i32 %3), !dbg !64
  br label %if.end, !dbg !65

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !66
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !68
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_44_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  call void @goodB2G(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__CWE129_fgets_44_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__CWE129_fgets_44_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !95, metadata !DIExpression()), !dbg !96
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !96
  store i32 -1, i32* %data, align 4, !dbg !97
  store i32 7, i32* %data, align 4, !dbg !98
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !99
  %1 = load i32, i32* %data, align 4, !dbg !100
  call void %0(i32 %1), !dbg !99
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !102 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !107
  %1 = load i32, i32* %data.addr, align 4, !dbg !108
  %cmp = icmp sge i32 %1, 0, !dbg !110
  br i1 %cmp, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !112
  %idxprom = sext i32 %2 to i64, !dbg !114
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !114
  %3 = load i32, i32* %arrayidx, align 4, !dbg !114
  call void @printIntLine(i32 %3), !dbg !115
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !120 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !123, metadata !DIExpression()), !dbg !124
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !124
  store i32 -1, i32* %data, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !126, metadata !DIExpression()), !dbg !128
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !128
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !129
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !131
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !132
  %cmp = icmp ne i8* %call, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.else, !dbg !134

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !137
  store i32 %call2, i32* %data, align 4, !dbg !138
  br label %if.end, !dbg !139

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !140
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !142
  %3 = load i32, i32* %data, align 4, !dbg !143
  call void %2(i32 %3), !dbg !142
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !145 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !148, metadata !DIExpression()), !dbg !150
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !150
  %1 = load i32, i32* %data.addr, align 4, !dbg !151
  %cmp = icmp sge i32 %1, 0, !dbg !153
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !154

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !155
  %cmp1 = icmp slt i32 %2, 10, !dbg !156
  br i1 %cmp1, label %if.then, label %if.else, !dbg !157

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !158
  %idxprom = sext i32 %3 to i64, !dbg !160
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !160
  %4 = load i32, i32* %arrayidx, align 4, !dbg !160
  call void @printIntLine(i32 %4), !dbg !161
  br label %if.end, !dbg !162

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !163
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !165
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_44.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_44_bad", scope: !13, file: !13, line: 41, type: !14, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_44.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 43, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 43, column: 9, scope: !12)
!19 = !DILocalVariable(name: "funcPtr", scope: !12, file: !13, line: 45, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !17}
!23 = !DILocation(line: 45, column: 12, scope: !12)
!24 = !DILocation(line: 47, column: 10, scope: !12)
!25 = !DILocalVariable(name: "inputBuffer", scope: !26, file: !13, line: 49, type: !27)
!26 = distinct !DILexicalBlock(scope: !12, file: !13, line: 48, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 49, column: 14, scope: !26)
!32 = !DILocation(line: 51, column: 19, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !13, line: 51, column: 13)
!34 = !DILocation(line: 51, column: 49, scope: !33)
!35 = !DILocation(line: 51, column: 13, scope: !33)
!36 = !DILocation(line: 51, column: 56, scope: !33)
!37 = !DILocation(line: 51, column: 13, scope: !26)
!38 = !DILocation(line: 54, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 52, column: 9)
!40 = !DILocation(line: 54, column: 20, scope: !39)
!41 = !DILocation(line: 54, column: 18, scope: !39)
!42 = !DILocation(line: 55, column: 9, scope: !39)
!43 = !DILocation(line: 58, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !13, line: 57, column: 9)
!45 = !DILocation(line: 62, column: 5, scope: !12)
!46 = !DILocation(line: 62, column: 13, scope: !12)
!47 = !DILocation(line: 63, column: 1, scope: !12)
!48 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 24, type: !21, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !13, line: 24, type: !17)
!50 = !DILocation(line: 24, column: 25, scope: !48)
!51 = !DILocalVariable(name: "buffer", scope: !52, file: !13, line: 27, type: !53)
!52 = distinct !DILexicalBlock(scope: !48, file: !13, line: 26, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 10)
!56 = !DILocation(line: 27, column: 13, scope: !52)
!57 = !DILocation(line: 30, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !13, line: 30, column: 13)
!59 = !DILocation(line: 30, column: 18, scope: !58)
!60 = !DILocation(line: 30, column: 13, scope: !52)
!61 = !DILocation(line: 32, column: 33, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !13, line: 31, column: 9)
!63 = !DILocation(line: 32, column: 26, scope: !62)
!64 = !DILocation(line: 32, column: 13, scope: !62)
!65 = !DILocation(line: 33, column: 9, scope: !62)
!66 = !DILocation(line: 36, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !58, file: !13, line: 35, column: 9)
!68 = !DILocation(line: 39, column: 1, scope: !48)
!69 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_44_good", scope: !13, file: !13, line: 138, type: !14, scopeLine: 139, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 140, column: 5, scope: !69)
!71 = !DILocation(line: 141, column: 5, scope: !69)
!72 = !DILocation(line: 142, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 152, type: !74, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!17, !17, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !13, line: 152, type: !17)
!79 = !DILocation(line: 152, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !13, line: 152, type: !76)
!81 = !DILocation(line: 152, column: 27, scope: !73)
!82 = !DILocation(line: 155, column: 22, scope: !73)
!83 = !DILocation(line: 155, column: 12, scope: !73)
!84 = !DILocation(line: 155, column: 5, scope: !73)
!85 = !DILocation(line: 157, column: 5, scope: !73)
!86 = !DILocation(line: 158, column: 5, scope: !73)
!87 = !DILocation(line: 159, column: 5, scope: !73)
!88 = !DILocation(line: 162, column: 5, scope: !73)
!89 = !DILocation(line: 163, column: 5, scope: !73)
!90 = !DILocation(line: 164, column: 5, scope: !73)
!91 = !DILocation(line: 166, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 87, type: !14, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !13, line: 89, type: !17)
!94 = !DILocation(line: 89, column: 9, scope: !92)
!95 = !DILocalVariable(name: "funcPtr", scope: !92, file: !13, line: 90, type: !20)
!96 = !DILocation(line: 90, column: 12, scope: !92)
!97 = !DILocation(line: 92, column: 10, scope: !92)
!98 = !DILocation(line: 95, column: 10, scope: !92)
!99 = !DILocation(line: 96, column: 5, scope: !92)
!100 = !DILocation(line: 96, column: 13, scope: !92)
!101 = !DILocation(line: 97, column: 1, scope: !92)
!102 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 70, type: !21, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", arg: 1, scope: !102, file: !13, line: 70, type: !17)
!104 = !DILocation(line: 70, column: 29, scope: !102)
!105 = !DILocalVariable(name: "buffer", scope: !106, file: !13, line: 73, type: !53)
!106 = distinct !DILexicalBlock(scope: !102, file: !13, line: 72, column: 5)
!107 = !DILocation(line: 73, column: 13, scope: !106)
!108 = !DILocation(line: 76, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !13, line: 76, column: 13)
!110 = !DILocation(line: 76, column: 18, scope: !109)
!111 = !DILocation(line: 76, column: 13, scope: !106)
!112 = !DILocation(line: 78, column: 33, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !13, line: 77, column: 9)
!114 = !DILocation(line: 78, column: 26, scope: !113)
!115 = !DILocation(line: 78, column: 13, scope: !113)
!116 = !DILocation(line: 79, column: 9, scope: !113)
!117 = !DILocation(line: 82, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !109, file: !13, line: 81, column: 9)
!119 = !DILocation(line: 85, column: 1, scope: !102)
!120 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 116, type: !14, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !13, line: 118, type: !17)
!122 = !DILocation(line: 118, column: 9, scope: !120)
!123 = !DILocalVariable(name: "funcPtr", scope: !120, file: !13, line: 119, type: !20)
!124 = !DILocation(line: 119, column: 12, scope: !120)
!125 = !DILocation(line: 121, column: 10, scope: !120)
!126 = !DILocalVariable(name: "inputBuffer", scope: !127, file: !13, line: 123, type: !27)
!127 = distinct !DILexicalBlock(scope: !120, file: !13, line: 122, column: 5)
!128 = !DILocation(line: 123, column: 14, scope: !127)
!129 = !DILocation(line: 125, column: 19, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !13, line: 125, column: 13)
!131 = !DILocation(line: 125, column: 49, scope: !130)
!132 = !DILocation(line: 125, column: 13, scope: !130)
!133 = !DILocation(line: 125, column: 56, scope: !130)
!134 = !DILocation(line: 125, column: 13, scope: !127)
!135 = !DILocation(line: 128, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !13, line: 126, column: 9)
!137 = !DILocation(line: 128, column: 20, scope: !136)
!138 = !DILocation(line: 128, column: 18, scope: !136)
!139 = !DILocation(line: 129, column: 9, scope: !136)
!140 = !DILocation(line: 132, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !130, file: !13, line: 131, column: 9)
!142 = !DILocation(line: 135, column: 5, scope: !120)
!143 = !DILocation(line: 135, column: 13, scope: !120)
!144 = !DILocation(line: 136, column: 1, scope: !120)
!145 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 100, type: !21, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", arg: 1, scope: !145, file: !13, line: 100, type: !17)
!147 = !DILocation(line: 100, column: 29, scope: !145)
!148 = !DILocalVariable(name: "buffer", scope: !149, file: !13, line: 103, type: !53)
!149 = distinct !DILexicalBlock(scope: !145, file: !13, line: 102, column: 5)
!150 = !DILocation(line: 103, column: 13, scope: !149)
!151 = !DILocation(line: 105, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !13, line: 105, column: 13)
!153 = !DILocation(line: 105, column: 18, scope: !152)
!154 = !DILocation(line: 105, column: 23, scope: !152)
!155 = !DILocation(line: 105, column: 26, scope: !152)
!156 = !DILocation(line: 105, column: 31, scope: !152)
!157 = !DILocation(line: 105, column: 13, scope: !149)
!158 = !DILocation(line: 107, column: 33, scope: !159)
!159 = distinct !DILexicalBlock(scope: !152, file: !13, line: 106, column: 9)
!160 = !DILocation(line: 107, column: 26, scope: !159)
!161 = !DILocation(line: 107, column: 13, scope: !159)
!162 = !DILocation(line: 108, column: 9, scope: !159)
!163 = !DILocation(line: 111, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !152, file: !13, line: 110, column: 9)
!165 = !DILocation(line: 114, column: 1, scope: !145)
