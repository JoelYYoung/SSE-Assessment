; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !18, metadata !DIExpression()), !dbg !20
  store i32* %data, i32** %dataPtr1, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !21, metadata !DIExpression()), !dbg !22
  store i32* %data, i32** %dataPtr2, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !24, metadata !DIExpression()), !dbg !26
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !27
  %1 = load i32, i32* %0, align 4, !dbg !28
  store i32 %1, i32* %data1, align 4, !dbg !26
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !29
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data1), !dbg !30
  %3 = load i32, i32* %data1, align 4, !dbg !31
  %4 = load i32*, i32** %dataPtr1, align 8, !dbg !32
  store i32 %3, i32* %4, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !34, metadata !DIExpression()), !dbg !36
  %5 = load i32*, i32** %dataPtr2, align 8, !dbg !37
  %6 = load i32, i32* %5, align 4, !dbg !38
  store i32 %6, i32* %data2, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !39, metadata !DIExpression()), !dbg !44
  %7 = bitcast [10 x i32]* %buffer to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !44
  %8 = load i32, i32* %data2, align 4, !dbg !45
  %cmp = icmp sge i32 %8, 0, !dbg !47
  br i1 %cmp, label %if.then, label %if.else, !dbg !48

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %data2, align 4, !dbg !49
  %idxprom = sext i32 %9 to i64, !dbg !51
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !51
  %10 = load i32, i32* %arrayidx, align 4, !dbg !51
  call void @printIntLine(i32 %10), !dbg !52
  br label %if.end, !dbg !53

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_32_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  call void @goodB2G(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__CWE129_fscanf_32_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__CWE129_fscanf_32_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* %data, i32** %dataPtr1, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* %data, i32** %dataPtr2, align 8, !dbg !87
  store i32 -1, i32* %data, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !89, metadata !DIExpression()), !dbg !91
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !92
  %1 = load i32, i32* %0, align 4, !dbg !93
  store i32 %1, i32* %data1, align 4, !dbg !91
  store i32 7, i32* %data1, align 4, !dbg !94
  %2 = load i32, i32* %data1, align 4, !dbg !95
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !96
  store i32 %2, i32* %3, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !98, metadata !DIExpression()), !dbg !100
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !101
  %5 = load i32, i32* %4, align 4, !dbg !102
  store i32 %5, i32* %data2, align 4, !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !103, metadata !DIExpression()), !dbg !105
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !105
  %7 = load i32, i32* %data2, align 4, !dbg !106
  %cmp = icmp sge i32 %7, 0, !dbg !108
  br i1 %cmp, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !110
  %idxprom = sext i32 %8 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !112
  %9 = load i32, i32* %arrayidx, align 4, !dbg !112
  call void @printIntLine(i32 %9), !dbg !113
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !118 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !121, metadata !DIExpression()), !dbg !122
  store i32* %data, i32** %dataPtr1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !123, metadata !DIExpression()), !dbg !124
  store i32* %data, i32** %dataPtr2, align 8, !dbg !124
  store i32 -1, i32* %data, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !126, metadata !DIExpression()), !dbg !128
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !129
  %1 = load i32, i32* %0, align 4, !dbg !130
  store i32 %1, i32* %data1, align 4, !dbg !128
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !131
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data1), !dbg !132
  %3 = load i32, i32* %data1, align 4, !dbg !133
  %4 = load i32*, i32** %dataPtr1, align 8, !dbg !134
  store i32 %3, i32* %4, align 4, !dbg !135
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !136, metadata !DIExpression()), !dbg !138
  %5 = load i32*, i32** %dataPtr2, align 8, !dbg !139
  %6 = load i32, i32* %5, align 4, !dbg !140
  store i32 %6, i32* %data2, align 4, !dbg !138
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !141, metadata !DIExpression()), !dbg !143
  %7 = bitcast [10 x i32]* %buffer to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !143
  %8 = load i32, i32* %data2, align 4, !dbg !144
  %cmp = icmp sge i32 %8, 0, !dbg !146
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !147

land.lhs.true:                                    ; preds = %entry
  %9 = load i32, i32* %data2, align 4, !dbg !148
  %cmp3 = icmp slt i32 %9, 10, !dbg !149
  br i1 %cmp3, label %if.then, label %if.else, !dbg !150

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %data2, align 4, !dbg !151
  %idxprom = sext i32 %10 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !153
  %11 = load i32, i32* %arrayidx, align 4, !dbg !153
  call void @printIntLine(i32 %11), !dbg !154
  br label %if.end, !dbg !155

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !156
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_32_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 25, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!20 = !DILocation(line: 25, column: 10, scope: !11)
!21 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 26, type: !19)
!22 = !DILocation(line: 26, column: 10, scope: !11)
!23 = !DILocation(line: 28, column: 10, scope: !11)
!24 = !DILocalVariable(name: "data", scope: !25, file: !12, line: 30, type: !16)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!26 = !DILocation(line: 30, column: 13, scope: !25)
!27 = !DILocation(line: 30, column: 21, scope: !25)
!28 = !DILocation(line: 30, column: 20, scope: !25)
!29 = !DILocation(line: 32, column: 16, scope: !25)
!30 = !DILocation(line: 32, column: 9, scope: !25)
!31 = !DILocation(line: 33, column: 21, scope: !25)
!32 = !DILocation(line: 33, column: 10, scope: !25)
!33 = !DILocation(line: 33, column: 19, scope: !25)
!34 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 36, type: !16)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!36 = !DILocation(line: 36, column: 13, scope: !35)
!37 = !DILocation(line: 36, column: 21, scope: !35)
!38 = !DILocation(line: 36, column: 20, scope: !35)
!39 = !DILocalVariable(name: "buffer", scope: !40, file: !12, line: 38, type: !41)
!40 = distinct !DILexicalBlock(scope: !35, file: !12, line: 37, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 10)
!44 = !DILocation(line: 38, column: 17, scope: !40)
!45 = !DILocation(line: 41, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !12, line: 41, column: 17)
!47 = !DILocation(line: 41, column: 22, scope: !46)
!48 = !DILocation(line: 41, column: 17, scope: !40)
!49 = !DILocation(line: 43, column: 37, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 42, column: 13)
!51 = !DILocation(line: 43, column: 30, scope: !50)
!52 = !DILocation(line: 43, column: 17, scope: !50)
!53 = !DILocation(line: 44, column: 13, scope: !50)
!54 = !DILocation(line: 47, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !46, file: !12, line: 46, column: 13)
!56 = !DILocation(line: 51, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_32_good", scope: !12, file: !12, line: 121, type: !13, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 123, column: 5, scope: !57)
!59 = !DILocation(line: 124, column: 5, scope: !57)
!60 = !DILocation(line: 125, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !62, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!16, !16, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 135, type: !16)
!68 = !DILocation(line: 135, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 135, type: !64)
!70 = !DILocation(line: 135, column: 27, scope: !61)
!71 = !DILocation(line: 138, column: 22, scope: !61)
!72 = !DILocation(line: 138, column: 12, scope: !61)
!73 = !DILocation(line: 138, column: 5, scope: !61)
!74 = !DILocation(line: 140, column: 5, scope: !61)
!75 = !DILocation(line: 141, column: 5, scope: !61)
!76 = !DILocation(line: 142, column: 5, scope: !61)
!77 = !DILocation(line: 145, column: 5, scope: !61)
!78 = !DILocation(line: 146, column: 5, scope: !61)
!79 = !DILocation(line: 147, column: 5, scope: !61)
!80 = !DILocation(line: 149, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 60, type: !16)
!83 = !DILocation(line: 60, column: 9, scope: !81)
!84 = !DILocalVariable(name: "dataPtr1", scope: !81, file: !12, line: 61, type: !19)
!85 = !DILocation(line: 61, column: 10, scope: !81)
!86 = !DILocalVariable(name: "dataPtr2", scope: !81, file: !12, line: 62, type: !19)
!87 = !DILocation(line: 62, column: 10, scope: !81)
!88 = !DILocation(line: 64, column: 10, scope: !81)
!89 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 66, type: !16)
!90 = distinct !DILexicalBlock(scope: !81, file: !12, line: 65, column: 5)
!91 = !DILocation(line: 66, column: 13, scope: !90)
!92 = !DILocation(line: 66, column: 21, scope: !90)
!93 = !DILocation(line: 66, column: 20, scope: !90)
!94 = !DILocation(line: 69, column: 14, scope: !90)
!95 = !DILocation(line: 70, column: 21, scope: !90)
!96 = !DILocation(line: 70, column: 10, scope: !90)
!97 = !DILocation(line: 70, column: 19, scope: !90)
!98 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 73, type: !16)
!99 = distinct !DILexicalBlock(scope: !81, file: !12, line: 72, column: 5)
!100 = !DILocation(line: 73, column: 13, scope: !99)
!101 = !DILocation(line: 73, column: 21, scope: !99)
!102 = !DILocation(line: 73, column: 20, scope: !99)
!103 = !DILocalVariable(name: "buffer", scope: !104, file: !12, line: 75, type: !41)
!104 = distinct !DILexicalBlock(scope: !99, file: !12, line: 74, column: 9)
!105 = !DILocation(line: 75, column: 17, scope: !104)
!106 = !DILocation(line: 78, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 78, column: 17)
!108 = !DILocation(line: 78, column: 22, scope: !107)
!109 = !DILocation(line: 78, column: 17, scope: !104)
!110 = !DILocation(line: 80, column: 37, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 79, column: 13)
!112 = !DILocation(line: 80, column: 30, scope: !111)
!113 = !DILocation(line: 80, column: 17, scope: !111)
!114 = !DILocation(line: 81, column: 13, scope: !111)
!115 = !DILocation(line: 84, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !107, file: !12, line: 83, column: 13)
!117 = !DILocation(line: 88, column: 1, scope: !81)
!118 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !12, line: 93, type: !16)
!120 = !DILocation(line: 93, column: 9, scope: !118)
!121 = !DILocalVariable(name: "dataPtr1", scope: !118, file: !12, line: 94, type: !19)
!122 = !DILocation(line: 94, column: 10, scope: !118)
!123 = !DILocalVariable(name: "dataPtr2", scope: !118, file: !12, line: 95, type: !19)
!124 = !DILocation(line: 95, column: 10, scope: !118)
!125 = !DILocation(line: 97, column: 10, scope: !118)
!126 = !DILocalVariable(name: "data", scope: !127, file: !12, line: 99, type: !16)
!127 = distinct !DILexicalBlock(scope: !118, file: !12, line: 98, column: 5)
!128 = !DILocation(line: 99, column: 13, scope: !127)
!129 = !DILocation(line: 99, column: 21, scope: !127)
!130 = !DILocation(line: 99, column: 20, scope: !127)
!131 = !DILocation(line: 101, column: 16, scope: !127)
!132 = !DILocation(line: 101, column: 9, scope: !127)
!133 = !DILocation(line: 102, column: 21, scope: !127)
!134 = !DILocation(line: 102, column: 10, scope: !127)
!135 = !DILocation(line: 102, column: 19, scope: !127)
!136 = !DILocalVariable(name: "data", scope: !137, file: !12, line: 105, type: !16)
!137 = distinct !DILexicalBlock(scope: !118, file: !12, line: 104, column: 5)
!138 = !DILocation(line: 105, column: 13, scope: !137)
!139 = !DILocation(line: 105, column: 21, scope: !137)
!140 = !DILocation(line: 105, column: 20, scope: !137)
!141 = !DILocalVariable(name: "buffer", scope: !142, file: !12, line: 107, type: !41)
!142 = distinct !DILexicalBlock(scope: !137, file: !12, line: 106, column: 9)
!143 = !DILocation(line: 107, column: 17, scope: !142)
!144 = !DILocation(line: 109, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 109, column: 17)
!146 = !DILocation(line: 109, column: 22, scope: !145)
!147 = !DILocation(line: 109, column: 27, scope: !145)
!148 = !DILocation(line: 109, column: 30, scope: !145)
!149 = !DILocation(line: 109, column: 35, scope: !145)
!150 = !DILocation(line: 109, column: 17, scope: !142)
!151 = !DILocation(line: 111, column: 37, scope: !152)
!152 = distinct !DILexicalBlock(scope: !145, file: !12, line: 110, column: 13)
!153 = !DILocation(line: 111, column: 30, scope: !152)
!154 = !DILocation(line: 111, column: 17, scope: !152)
!155 = !DILocation(line: 112, column: 13, scope: !152)
!156 = !DILocation(line: 115, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !145, file: !12, line: 114, column: 13)
!158 = !DILocation(line: 119, column: 1, scope: !118)
