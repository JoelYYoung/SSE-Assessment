; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_32_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data4 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32* %data, i32** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* %data, i32** %dataPtr2, align 8, !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !28
  %1 = load i32, i32* %0, align 4, !dbg !29
  store i32 %1, i32* %data1, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  %2 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !37
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !39
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %3), !dbg !40
  %cmp = icmp ne i8* %call, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !43
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !45
  store i32 %call3, i32* %data1, align 4, !dbg !46
  br label %if.end, !dbg !47

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %data1, align 4, !dbg !50
  %5 = load i32*, i32** %dataPtr1, align 8, !dbg !51
  store i32 %4, i32* %5, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %data4, metadata !53, metadata !DIExpression()), !dbg !55
  %6 = load i32*, i32** %dataPtr2, align 8, !dbg !56
  %7 = load i32, i32* %6, align 4, !dbg !57
  store i32 %7, i32* %data4, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !58, metadata !DIExpression()), !dbg !63
  %8 = bitcast [10 x i32]* %buffer to i8*, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !63
  %9 = load i32, i32* %data4, align 4, !dbg !64
  %cmp5 = icmp sge i32 %9, 0, !dbg !66
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !67

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %data4, align 4, !dbg !68
  %idxprom = sext i32 %10 to i64, !dbg !70
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !70
  %11 = load i32, i32* %arrayidx, align 4, !dbg !70
  call void @printIntLine(i32 %11), !dbg !71
  br label %if.end8, !dbg !72

if.else7:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  ret void, !dbg !75
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_32_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  call void @goodB2G(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE126_Buffer_Overread__CWE129_fgets_32_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  call void @CWE126_Buffer_Overread__CWE129_fgets_32_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !102, metadata !DIExpression()), !dbg !103
  store i32* %data, i32** %dataPtr1, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* %data, i32** %dataPtr2, align 8, !dbg !105
  store i32 -1, i32* %data, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !107, metadata !DIExpression()), !dbg !109
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !110
  %1 = load i32, i32* %0, align 4, !dbg !111
  store i32 %1, i32* %data1, align 4, !dbg !109
  store i32 7, i32* %data1, align 4, !dbg !112
  %2 = load i32, i32* %data1, align 4, !dbg !113
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !114
  store i32 %2, i32* %3, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !116, metadata !DIExpression()), !dbg !118
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !119
  %5 = load i32, i32* %4, align 4, !dbg !120
  store i32 %5, i32* %data2, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !121, metadata !DIExpression()), !dbg !123
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !123
  %7 = load i32, i32* %data2, align 4, !dbg !124
  %cmp = icmp sge i32 %7, 0, !dbg !126
  br i1 %cmp, label %if.then, label %if.else, !dbg !127

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !128
  %idxprom = sext i32 %8 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !130
  %9 = load i32, i32* %arrayidx, align 4, !dbg !130
  call void @printIntLine(i32 %9), !dbg !131
  br label %if.end, !dbg !132

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !136 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data4 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !139, metadata !DIExpression()), !dbg !140
  store i32* %data, i32** %dataPtr1, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !141, metadata !DIExpression()), !dbg !142
  store i32* %data, i32** %dataPtr2, align 8, !dbg !142
  store i32 -1, i32* %data, align 4, !dbg !143
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !144, metadata !DIExpression()), !dbg !146
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !147
  %1 = load i32, i32* %0, align 4, !dbg !148
  store i32 %1, i32* %data1, align 4, !dbg !146
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !149, metadata !DIExpression()), !dbg !151
  %2 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 14, i1 false), !dbg !151
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !154
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %3), !dbg !155
  %cmp = icmp ne i8* %call, null, !dbg !156
  br i1 %cmp, label %if.then, label %if.else, !dbg !157

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !158
  %call3 = call i32 @atoi(i8* %arraydecay2) #6, !dbg !160
  store i32 %call3, i32* %data1, align 4, !dbg !161
  br label %if.end, !dbg !162

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !163
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %data1, align 4, !dbg !165
  %5 = load i32*, i32** %dataPtr1, align 8, !dbg !166
  store i32 %4, i32* %5, align 4, !dbg !167
  call void @llvm.dbg.declare(metadata i32* %data4, metadata !168, metadata !DIExpression()), !dbg !170
  %6 = load i32*, i32** %dataPtr2, align 8, !dbg !171
  %7 = load i32, i32* %6, align 4, !dbg !172
  store i32 %7, i32* %data4, align 4, !dbg !170
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !173, metadata !DIExpression()), !dbg !175
  %8 = bitcast [10 x i32]* %buffer to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !175
  %9 = load i32, i32* %data4, align 4, !dbg !176
  %cmp5 = icmp sge i32 %9, 0, !dbg !178
  br i1 %cmp5, label %land.lhs.true, label %if.else8, !dbg !179

land.lhs.true:                                    ; preds = %if.end
  %10 = load i32, i32* %data4, align 4, !dbg !180
  %cmp6 = icmp slt i32 %10, 10, !dbg !181
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !182

if.then7:                                         ; preds = %land.lhs.true
  %11 = load i32, i32* %data4, align 4, !dbg !183
  %idxprom = sext i32 %11 to i64, !dbg !185
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !185
  %12 = load i32, i32* %arrayidx, align 4, !dbg !185
  call void @printIntLine(i32 %12), !dbg !186
  br label %if.end9, !dbg !187

if.else8:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !188
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %if.then7
  ret void, !dbg !190
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_32_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_32.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocalVariable(name: "dataPtr1", scope: !12, file: !13, line: 27, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!21 = !DILocation(line: 27, column: 10, scope: !12)
!22 = !DILocalVariable(name: "dataPtr2", scope: !12, file: !13, line: 28, type: !20)
!23 = !DILocation(line: 28, column: 10, scope: !12)
!24 = !DILocation(line: 30, column: 10, scope: !12)
!25 = !DILocalVariable(name: "data", scope: !26, file: !13, line: 32, type: !17)
!26 = distinct !DILexicalBlock(scope: !12, file: !13, line: 31, column: 5)
!27 = !DILocation(line: 32, column: 13, scope: !26)
!28 = !DILocation(line: 32, column: 21, scope: !26)
!29 = !DILocation(line: 32, column: 20, scope: !26)
!30 = !DILocalVariable(name: "inputBuffer", scope: !31, file: !13, line: 34, type: !32)
!31 = distinct !DILexicalBlock(scope: !26, file: !13, line: 33, column: 9)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 112, elements: !34)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !{!35}
!35 = !DISubrange(count: 14)
!36 = !DILocation(line: 34, column: 18, scope: !31)
!37 = !DILocation(line: 36, column: 23, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !13, line: 36, column: 17)
!39 = !DILocation(line: 36, column: 53, scope: !38)
!40 = !DILocation(line: 36, column: 17, scope: !38)
!41 = !DILocation(line: 36, column: 60, scope: !38)
!42 = !DILocation(line: 36, column: 17, scope: !31)
!43 = !DILocation(line: 39, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !13, line: 37, column: 13)
!45 = !DILocation(line: 39, column: 24, scope: !44)
!46 = !DILocation(line: 39, column: 22, scope: !44)
!47 = !DILocation(line: 40, column: 13, scope: !44)
!48 = !DILocation(line: 43, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !13, line: 42, column: 13)
!50 = !DILocation(line: 46, column: 21, scope: !26)
!51 = !DILocation(line: 46, column: 10, scope: !26)
!52 = !DILocation(line: 46, column: 19, scope: !26)
!53 = !DILocalVariable(name: "data", scope: !54, file: !13, line: 49, type: !17)
!54 = distinct !DILexicalBlock(scope: !12, file: !13, line: 48, column: 5)
!55 = !DILocation(line: 49, column: 13, scope: !54)
!56 = !DILocation(line: 49, column: 21, scope: !54)
!57 = !DILocation(line: 49, column: 20, scope: !54)
!58 = !DILocalVariable(name: "buffer", scope: !59, file: !13, line: 51, type: !60)
!59 = distinct !DILexicalBlock(scope: !54, file: !13, line: 50, column: 9)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 10)
!63 = !DILocation(line: 51, column: 17, scope: !59)
!64 = !DILocation(line: 54, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !13, line: 54, column: 17)
!66 = !DILocation(line: 54, column: 22, scope: !65)
!67 = !DILocation(line: 54, column: 17, scope: !59)
!68 = !DILocation(line: 56, column: 37, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !13, line: 55, column: 13)
!70 = !DILocation(line: 56, column: 30, scope: !69)
!71 = !DILocation(line: 56, column: 17, scope: !69)
!72 = !DILocation(line: 57, column: 13, scope: !69)
!73 = !DILocation(line: 60, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !65, file: !13, line: 59, column: 13)
!75 = !DILocation(line: 64, column: 1, scope: !12)
!76 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_32_good", scope: !13, file: !13, line: 145, type: !14, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 147, column: 5, scope: !76)
!78 = !DILocation(line: 148, column: 5, scope: !76)
!79 = !DILocation(line: 149, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 159, type: !81, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!17, !17, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !13, line: 159, type: !17)
!86 = !DILocation(line: 159, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !13, line: 159, type: !83)
!88 = !DILocation(line: 159, column: 27, scope: !80)
!89 = !DILocation(line: 162, column: 22, scope: !80)
!90 = !DILocation(line: 162, column: 12, scope: !80)
!91 = !DILocation(line: 162, column: 5, scope: !80)
!92 = !DILocation(line: 164, column: 5, scope: !80)
!93 = !DILocation(line: 165, column: 5, scope: !80)
!94 = !DILocation(line: 166, column: 5, scope: !80)
!95 = !DILocation(line: 169, column: 5, scope: !80)
!96 = !DILocation(line: 170, column: 5, scope: !80)
!97 = !DILocation(line: 171, column: 5, scope: !80)
!98 = !DILocation(line: 173, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 71, type: !14, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !13, line: 73, type: !17)
!101 = !DILocation(line: 73, column: 9, scope: !99)
!102 = !DILocalVariable(name: "dataPtr1", scope: !99, file: !13, line: 74, type: !20)
!103 = !DILocation(line: 74, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataPtr2", scope: !99, file: !13, line: 75, type: !20)
!105 = !DILocation(line: 75, column: 10, scope: !99)
!106 = !DILocation(line: 77, column: 10, scope: !99)
!107 = !DILocalVariable(name: "data", scope: !108, file: !13, line: 79, type: !17)
!108 = distinct !DILexicalBlock(scope: !99, file: !13, line: 78, column: 5)
!109 = !DILocation(line: 79, column: 13, scope: !108)
!110 = !DILocation(line: 79, column: 21, scope: !108)
!111 = !DILocation(line: 79, column: 20, scope: !108)
!112 = !DILocation(line: 82, column: 14, scope: !108)
!113 = !DILocation(line: 83, column: 21, scope: !108)
!114 = !DILocation(line: 83, column: 10, scope: !108)
!115 = !DILocation(line: 83, column: 19, scope: !108)
!116 = !DILocalVariable(name: "data", scope: !117, file: !13, line: 86, type: !17)
!117 = distinct !DILexicalBlock(scope: !99, file: !13, line: 85, column: 5)
!118 = !DILocation(line: 86, column: 13, scope: !117)
!119 = !DILocation(line: 86, column: 21, scope: !117)
!120 = !DILocation(line: 86, column: 20, scope: !117)
!121 = !DILocalVariable(name: "buffer", scope: !122, file: !13, line: 88, type: !60)
!122 = distinct !DILexicalBlock(scope: !117, file: !13, line: 87, column: 9)
!123 = !DILocation(line: 88, column: 17, scope: !122)
!124 = !DILocation(line: 91, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !13, line: 91, column: 17)
!126 = !DILocation(line: 91, column: 22, scope: !125)
!127 = !DILocation(line: 91, column: 17, scope: !122)
!128 = !DILocation(line: 93, column: 37, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !13, line: 92, column: 13)
!130 = !DILocation(line: 93, column: 30, scope: !129)
!131 = !DILocation(line: 93, column: 17, scope: !129)
!132 = !DILocation(line: 94, column: 13, scope: !129)
!133 = !DILocation(line: 97, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !13, line: 96, column: 13)
!135 = !DILocation(line: 101, column: 1, scope: !99)
!136 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 104, type: !14, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !13, line: 106, type: !17)
!138 = !DILocation(line: 106, column: 9, scope: !136)
!139 = !DILocalVariable(name: "dataPtr1", scope: !136, file: !13, line: 107, type: !20)
!140 = !DILocation(line: 107, column: 10, scope: !136)
!141 = !DILocalVariable(name: "dataPtr2", scope: !136, file: !13, line: 108, type: !20)
!142 = !DILocation(line: 108, column: 10, scope: !136)
!143 = !DILocation(line: 110, column: 10, scope: !136)
!144 = !DILocalVariable(name: "data", scope: !145, file: !13, line: 112, type: !17)
!145 = distinct !DILexicalBlock(scope: !136, file: !13, line: 111, column: 5)
!146 = !DILocation(line: 112, column: 13, scope: !145)
!147 = !DILocation(line: 112, column: 21, scope: !145)
!148 = !DILocation(line: 112, column: 20, scope: !145)
!149 = !DILocalVariable(name: "inputBuffer", scope: !150, file: !13, line: 114, type: !32)
!150 = distinct !DILexicalBlock(scope: !145, file: !13, line: 113, column: 9)
!151 = !DILocation(line: 114, column: 18, scope: !150)
!152 = !DILocation(line: 116, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !13, line: 116, column: 17)
!154 = !DILocation(line: 116, column: 53, scope: !153)
!155 = !DILocation(line: 116, column: 17, scope: !153)
!156 = !DILocation(line: 116, column: 60, scope: !153)
!157 = !DILocation(line: 116, column: 17, scope: !150)
!158 = !DILocation(line: 119, column: 29, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !13, line: 117, column: 13)
!160 = !DILocation(line: 119, column: 24, scope: !159)
!161 = !DILocation(line: 119, column: 22, scope: !159)
!162 = !DILocation(line: 120, column: 13, scope: !159)
!163 = !DILocation(line: 123, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !153, file: !13, line: 122, column: 13)
!165 = !DILocation(line: 126, column: 21, scope: !145)
!166 = !DILocation(line: 126, column: 10, scope: !145)
!167 = !DILocation(line: 126, column: 19, scope: !145)
!168 = !DILocalVariable(name: "data", scope: !169, file: !13, line: 129, type: !17)
!169 = distinct !DILexicalBlock(scope: !136, file: !13, line: 128, column: 5)
!170 = !DILocation(line: 129, column: 13, scope: !169)
!171 = !DILocation(line: 129, column: 21, scope: !169)
!172 = !DILocation(line: 129, column: 20, scope: !169)
!173 = !DILocalVariable(name: "buffer", scope: !174, file: !13, line: 131, type: !60)
!174 = distinct !DILexicalBlock(scope: !169, file: !13, line: 130, column: 9)
!175 = !DILocation(line: 131, column: 17, scope: !174)
!176 = !DILocation(line: 133, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !13, line: 133, column: 17)
!178 = !DILocation(line: 133, column: 22, scope: !177)
!179 = !DILocation(line: 133, column: 27, scope: !177)
!180 = !DILocation(line: 133, column: 30, scope: !177)
!181 = !DILocation(line: 133, column: 35, scope: !177)
!182 = !DILocation(line: 133, column: 17, scope: !174)
!183 = !DILocation(line: 135, column: 37, scope: !184)
!184 = distinct !DILexicalBlock(scope: !177, file: !13, line: 134, column: 13)
!185 = !DILocation(line: 135, column: 30, scope: !184)
!186 = !DILocation(line: 135, column: 17, scope: !184)
!187 = !DILocation(line: 136, column: 13, scope: !184)
!188 = !DILocation(line: 139, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !177, file: !13, line: 138, column: 13)
!190 = !DILocation(line: 143, column: 1, scope: !136)
