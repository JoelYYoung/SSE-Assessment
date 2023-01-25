; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@CWE126_Buffer_Overread__CWE129_fgets_45_badData = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@CWE126_Buffer_Overread__CWE129_fgets_45_goodG2BData = internal global i32 0, align 4, !dbg !9
@CWE126_Buffer_Overread__CWE129_fgets_45_goodB2GData = internal global i32 0, align 4, !dbg !13
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !24, metadata !DIExpression()), !dbg !25
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
  store i32 %2, i32* @CWE126_Buffer_Overread__CWE129_fgets_45_badData, align 4, !dbg !48
  call void @badSink(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_45_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  call void @goodB2G(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE126_Buffer_Overread__CWE129_fgets_45_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__CWE129_fgets_45_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_fgets_45_badData, align 4, !dbg !77
  store i32 %0, i32* %data, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !78, metadata !DIExpression()), !dbg !83
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !83
  %2 = load i32, i32* %data, align 4, !dbg !84
  %cmp = icmp sge i32 %2, 0, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !88
  %idxprom = sext i32 %3 to i64, !dbg !90
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !90
  %4 = load i32, i32* %arrayidx, align 4, !dbg !90
  call void @printIntLine(i32 %4), !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !95
}

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32 -1, i32* %data, align 4, !dbg !99
  store i32 7, i32* %data, align 4, !dbg !100
  %0 = load i32, i32* %data, align 4, !dbg !101
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_fgets_45_goodG2BData, align 4, !dbg !102
  call void @goodG2BSink(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !105 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_fgets_45_goodG2BData, align 4, !dbg !108
  store i32 %0, i32* %data, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !109, metadata !DIExpression()), !dbg !111
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !111
  %2 = load i32, i32* %data, align 4, !dbg !112
  %cmp = icmp sge i32 %2, 0, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !116
  %idxprom = sext i32 %3 to i64, !dbg !118
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !118
  %4 = load i32, i32* %arrayidx, align 4, !dbg !118
  call void @printIntLine(i32 %4), !dbg !119
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !124 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 -1, i32* %data, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !128, metadata !DIExpression()), !dbg !130
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !130
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !131
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !133
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !134
  %cmp = icmp ne i8* %call, null, !dbg !135
  br i1 %cmp, label %if.then, label %if.else, !dbg !136

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !137
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !139
  store i32 %call2, i32* %data, align 4, !dbg !140
  br label %if.end, !dbg !141

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !142
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !144
  store i32 %2, i32* @CWE126_Buffer_Overread__CWE129_fgets_45_goodB2GData, align 4, !dbg !145
  call void @goodB2GSink(), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !148 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = load i32, i32* @CWE126_Buffer_Overread__CWE129_fgets_45_goodB2GData, align 4, !dbg !151
  store i32 %0, i32* %data, align 4, !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !152, metadata !DIExpression()), !dbg !154
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !154
  %2 = load i32, i32* %data, align 4, !dbg !155
  %cmp = icmp sge i32 %2, 0, !dbg !157
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !158

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !159
  %cmp1 = icmp slt i32 %3, 10, !dbg !160
  br i1 %cmp1, label %if.then, label %if.else, !dbg !161

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !162
  %idxprom = sext i32 %4 to i64, !dbg !164
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !164
  %5 = load i32, i32* %arrayidx, align 4, !dbg !164
  call void @printIntLine(i32 %5), !dbg !165
  br label %if.end, !dbg !166

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !167
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_fgets_45_badData", scope: !2, file: !11, line: 22, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !13}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_fgets_45_goodG2BData", scope: !2, file: !11, line: 23, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_45.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_fgets_45_goodB2GData", scope: !2, file: !11, line: 24, type: !12, isLocal: true, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_45_bad", scope: !11, file: !11, line: 46, type: !22, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !11, line: 48, type: !12)
!25 = !DILocation(line: 48, column: 9, scope: !21)
!26 = !DILocation(line: 50, column: 10, scope: !21)
!27 = !DILocalVariable(name: "inputBuffer", scope: !28, file: !11, line: 52, type: !29)
!28 = distinct !DILexicalBlock(scope: !21, file: !11, line: 51, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 112, elements: !31)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !{!32}
!32 = !DISubrange(count: 14)
!33 = !DILocation(line: 52, column: 14, scope: !28)
!34 = !DILocation(line: 54, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !11, line: 54, column: 13)
!36 = !DILocation(line: 54, column: 49, scope: !35)
!37 = !DILocation(line: 54, column: 13, scope: !35)
!38 = !DILocation(line: 54, column: 56, scope: !35)
!39 = !DILocation(line: 54, column: 13, scope: !28)
!40 = !DILocation(line: 57, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !11, line: 55, column: 9)
!42 = !DILocation(line: 57, column: 20, scope: !41)
!43 = !DILocation(line: 57, column: 18, scope: !41)
!44 = !DILocation(line: 58, column: 9, scope: !41)
!45 = !DILocation(line: 61, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !11, line: 60, column: 9)
!47 = !DILocation(line: 64, column: 55, scope: !21)
!48 = !DILocation(line: 64, column: 53, scope: !21)
!49 = !DILocation(line: 65, column: 5, scope: !21)
!50 = !DILocation(line: 66, column: 1, scope: !21)
!51 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_45_good", scope: !11, file: !11, line: 143, type: !22, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 145, column: 5, scope: !51)
!53 = !DILocation(line: 146, column: 5, scope: !51)
!54 = !DILocation(line: 147, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 157, type: !56, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!12, !12, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !11, line: 157, type: !12)
!61 = !DILocation(line: 157, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !11, line: 157, type: !58)
!63 = !DILocation(line: 157, column: 27, scope: !55)
!64 = !DILocation(line: 160, column: 22, scope: !55)
!65 = !DILocation(line: 160, column: 12, scope: !55)
!66 = !DILocation(line: 160, column: 5, scope: !55)
!67 = !DILocation(line: 162, column: 5, scope: !55)
!68 = !DILocation(line: 163, column: 5, scope: !55)
!69 = !DILocation(line: 164, column: 5, scope: !55)
!70 = !DILocation(line: 167, column: 5, scope: !55)
!71 = !DILocation(line: 168, column: 5, scope: !55)
!72 = !DILocation(line: 169, column: 5, scope: !55)
!73 = !DILocation(line: 171, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 28, type: !22, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !11, line: 30, type: !12)
!76 = !DILocation(line: 30, column: 9, scope: !74)
!77 = !DILocation(line: 30, column: 16, scope: !74)
!78 = !DILocalVariable(name: "buffer", scope: !79, file: !11, line: 32, type: !80)
!79 = distinct !DILexicalBlock(scope: !74, file: !11, line: 31, column: 5)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 10)
!83 = !DILocation(line: 32, column: 13, scope: !79)
!84 = !DILocation(line: 35, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !11, line: 35, column: 13)
!86 = !DILocation(line: 35, column: 18, scope: !85)
!87 = !DILocation(line: 35, column: 13, scope: !79)
!88 = !DILocation(line: 37, column: 33, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !11, line: 36, column: 9)
!90 = !DILocation(line: 37, column: 26, scope: !89)
!91 = !DILocation(line: 37, column: 13, scope: !89)
!92 = !DILocation(line: 38, column: 9, scope: !89)
!93 = !DILocation(line: 41, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !85, file: !11, line: 40, column: 9)
!95 = !DILocation(line: 44, column: 1, scope: !74)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 91, type: !22, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !11, line: 93, type: !12)
!98 = !DILocation(line: 93, column: 9, scope: !96)
!99 = !DILocation(line: 95, column: 10, scope: !96)
!100 = !DILocation(line: 98, column: 10, scope: !96)
!101 = !DILocation(line: 99, column: 59, scope: !96)
!102 = !DILocation(line: 99, column: 57, scope: !96)
!103 = !DILocation(line: 100, column: 5, scope: !96)
!104 = !DILocation(line: 101, column: 1, scope: !96)
!105 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 73, type: !22, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !11, line: 75, type: !12)
!107 = !DILocation(line: 75, column: 9, scope: !105)
!108 = !DILocation(line: 75, column: 16, scope: !105)
!109 = !DILocalVariable(name: "buffer", scope: !110, file: !11, line: 77, type: !80)
!110 = distinct !DILexicalBlock(scope: !105, file: !11, line: 76, column: 5)
!111 = !DILocation(line: 77, column: 13, scope: !110)
!112 = !DILocation(line: 80, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !11, line: 80, column: 13)
!114 = !DILocation(line: 80, column: 18, scope: !113)
!115 = !DILocation(line: 80, column: 13, scope: !110)
!116 = !DILocation(line: 82, column: 33, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !11, line: 81, column: 9)
!118 = !DILocation(line: 82, column: 26, scope: !117)
!119 = !DILocation(line: 82, column: 13, scope: !117)
!120 = !DILocation(line: 83, column: 9, scope: !117)
!121 = !DILocation(line: 86, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !113, file: !11, line: 85, column: 9)
!123 = !DILocation(line: 89, column: 1, scope: !105)
!124 = distinct !DISubprogram(name: "goodB2G", scope: !11, file: !11, line: 121, type: !22, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !11, line: 123, type: !12)
!126 = !DILocation(line: 123, column: 9, scope: !124)
!127 = !DILocation(line: 125, column: 10, scope: !124)
!128 = !DILocalVariable(name: "inputBuffer", scope: !129, file: !11, line: 127, type: !29)
!129 = distinct !DILexicalBlock(scope: !124, file: !11, line: 126, column: 5)
!130 = !DILocation(line: 127, column: 14, scope: !129)
!131 = !DILocation(line: 129, column: 19, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !11, line: 129, column: 13)
!133 = !DILocation(line: 129, column: 49, scope: !132)
!134 = !DILocation(line: 129, column: 13, scope: !132)
!135 = !DILocation(line: 129, column: 56, scope: !132)
!136 = !DILocation(line: 129, column: 13, scope: !129)
!137 = !DILocation(line: 132, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !11, line: 130, column: 9)
!139 = !DILocation(line: 132, column: 20, scope: !138)
!140 = !DILocation(line: 132, column: 18, scope: !138)
!141 = !DILocation(line: 133, column: 9, scope: !138)
!142 = !DILocation(line: 136, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !132, file: !11, line: 135, column: 9)
!144 = !DILocation(line: 139, column: 59, scope: !124)
!145 = !DILocation(line: 139, column: 57, scope: !124)
!146 = !DILocation(line: 140, column: 5, scope: !124)
!147 = !DILocation(line: 141, column: 1, scope: !124)
!148 = distinct !DISubprogram(name: "goodB2GSink", scope: !11, file: !11, line: 104, type: !22, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!149 = !DILocalVariable(name: "data", scope: !148, file: !11, line: 106, type: !12)
!150 = !DILocation(line: 106, column: 9, scope: !148)
!151 = !DILocation(line: 106, column: 16, scope: !148)
!152 = !DILocalVariable(name: "buffer", scope: !153, file: !11, line: 108, type: !80)
!153 = distinct !DILexicalBlock(scope: !148, file: !11, line: 107, column: 5)
!154 = !DILocation(line: 108, column: 13, scope: !153)
!155 = !DILocation(line: 110, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !11, line: 110, column: 13)
!157 = !DILocation(line: 110, column: 18, scope: !156)
!158 = !DILocation(line: 110, column: 23, scope: !156)
!159 = !DILocation(line: 110, column: 26, scope: !156)
!160 = !DILocation(line: 110, column: 31, scope: !156)
!161 = !DILocation(line: 110, column: 13, scope: !153)
!162 = !DILocation(line: 112, column: 33, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !11, line: 111, column: 9)
!164 = !DILocation(line: 112, column: 26, scope: !163)
!165 = !DILocation(line: 112, column: 13, scope: !163)
!166 = !DILocation(line: 113, column: 9, scope: !163)
!167 = !DILocation(line: 116, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !156, file: !11, line: 115, column: 9)
!169 = !DILocation(line: 119, column: 1, scope: !148)
