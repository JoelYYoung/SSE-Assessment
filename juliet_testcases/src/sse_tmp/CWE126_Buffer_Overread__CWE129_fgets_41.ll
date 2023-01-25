; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_41_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  %2 = load i32, i32* %data, align 4, !dbg !40
  call void @badSink(i32 %2), !dbg !41
  ret void, !dbg !42
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
define internal void @badSink(i32 %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !48, metadata !DIExpression()), !dbg !53
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !53
  %1 = load i32, i32* %data.addr, align 4, !dbg !54
  %cmp = icmp sge i32 %1, 0, !dbg !56
  br i1 %cmp, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !58
  %idxprom = sext i32 %2 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !60
  %3 = load i32, i32* %arrayidx, align 4, !dbg !60
  call void @printIntLine(i32 %3), !dbg !61
  br label %if.end, !dbg !62

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !63
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_41_good() #0 !dbg !66 {
entry:
  call void @goodB2G(), !dbg !67
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #7, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #7, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__CWE129_fgets_41_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__CWE129_fgets_41_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !89 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 -1, i32* %data, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !98
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !99
  %cmp = icmp ne i8* %call, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !102
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !104
  store i32 %call2, i32* %data, align 4, !dbg !105
  br label %if.end, !dbg !106

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !109
  call void @goodB2GSink(i32 %2), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !115, metadata !DIExpression()), !dbg !117
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !117
  %1 = load i32, i32* %data.addr, align 4, !dbg !118
  %cmp = icmp sge i32 %1, 0, !dbg !120
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !121

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !122
  %cmp1 = icmp slt i32 %2, 10, !dbg !123
  br i1 %cmp1, label %if.then, label %if.else, !dbg !124

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !125
  %idxprom = sext i32 %3 to i64, !dbg !127
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !127
  %4 = load i32, i32* %arrayidx, align 4, !dbg !127
  call void @printIntLine(i32 %4), !dbg !128
  br label %if.end, !dbg !129

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !133 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !134, metadata !DIExpression()), !dbg !135
  store i32 -1, i32* %data, align 4, !dbg !136
  store i32 7, i32* %data, align 4, !dbg !137
  %0 = load i32, i32* %data, align 4, !dbg !138
  call void @goodG2BSink(i32 %0), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !141 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !144, metadata !DIExpression()), !dbg !146
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !146
  %1 = load i32, i32* %data.addr, align 4, !dbg !147
  %cmp = icmp sge i32 %1, 0, !dbg !149
  br i1 %cmp, label %if.then, label %if.else, !dbg !150

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !151
  %idxprom = sext i32 %2 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !153
  %3 = load i32, i32* %arrayidx, align 4, !dbg !153
  call void @printIntLine(i32 %3), !dbg !154
  br label %if.end, !dbg !155

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !156
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !158
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_41_bad", scope: !13, file: !13, line: 41, type: !14, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_41.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 43, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 43, column: 9, scope: !12)
!19 = !DILocation(line: 45, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 47, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 46, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 47, column: 14, scope: !21)
!27 = !DILocation(line: 49, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 49, column: 13)
!29 = !DILocation(line: 49, column: 49, scope: !28)
!30 = !DILocation(line: 49, column: 13, scope: !28)
!31 = !DILocation(line: 49, column: 56, scope: !28)
!32 = !DILocation(line: 49, column: 13, scope: !21)
!33 = !DILocation(line: 52, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 50, column: 9)
!35 = !DILocation(line: 52, column: 20, scope: !34)
!36 = !DILocation(line: 52, column: 18, scope: !34)
!37 = !DILocation(line: 53, column: 9, scope: !34)
!38 = !DILocation(line: 56, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 55, column: 9)
!40 = !DILocation(line: 59, column: 13, scope: !12)
!41 = !DILocation(line: 59, column: 5, scope: !12)
!42 = !DILocation(line: 60, column: 1, scope: !12)
!43 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 24, type: !44, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{null, !17}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !13, line: 24, type: !17)
!47 = !DILocation(line: 24, column: 25, scope: !43)
!48 = !DILocalVariable(name: "buffer", scope: !49, file: !13, line: 27, type: !50)
!49 = distinct !DILexicalBlock(scope: !43, file: !13, line: 26, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 10)
!53 = !DILocation(line: 27, column: 13, scope: !49)
!54 = !DILocation(line: 30, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !13, line: 30, column: 13)
!56 = !DILocation(line: 30, column: 18, scope: !55)
!57 = !DILocation(line: 30, column: 13, scope: !49)
!58 = !DILocation(line: 32, column: 33, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !13, line: 31, column: 9)
!60 = !DILocation(line: 32, column: 26, scope: !59)
!61 = !DILocation(line: 32, column: 13, scope: !59)
!62 = !DILocation(line: 33, column: 9, scope: !59)
!63 = !DILocation(line: 36, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !55, file: !13, line: 35, column: 9)
!65 = !DILocation(line: 39, column: 1, scope: !43)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_41_good", scope: !13, file: !13, line: 133, type: !14, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 135, column: 5, scope: !66)
!68 = !DILocation(line: 136, column: 5, scope: !66)
!69 = !DILocation(line: 137, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 148, type: !71, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!17, !17, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !13, line: 148, type: !17)
!76 = !DILocation(line: 148, column: 14, scope: !70)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !13, line: 148, type: !73)
!78 = !DILocation(line: 148, column: 27, scope: !70)
!79 = !DILocation(line: 151, column: 22, scope: !70)
!80 = !DILocation(line: 151, column: 12, scope: !70)
!81 = !DILocation(line: 151, column: 5, scope: !70)
!82 = !DILocation(line: 153, column: 5, scope: !70)
!83 = !DILocation(line: 154, column: 5, scope: !70)
!84 = !DILocation(line: 155, column: 5, scope: !70)
!85 = !DILocation(line: 158, column: 5, scope: !70)
!86 = !DILocation(line: 159, column: 5, scope: !70)
!87 = !DILocation(line: 160, column: 5, scope: !70)
!88 = !DILocation(line: 162, column: 5, scope: !70)
!89 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 112, type: !14, scopeLine: 113, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !13, line: 114, type: !17)
!91 = !DILocation(line: 114, column: 9, scope: !89)
!92 = !DILocation(line: 116, column: 10, scope: !89)
!93 = !DILocalVariable(name: "inputBuffer", scope: !94, file: !13, line: 118, type: !22)
!94 = distinct !DILexicalBlock(scope: !89, file: !13, line: 117, column: 5)
!95 = !DILocation(line: 118, column: 14, scope: !94)
!96 = !DILocation(line: 120, column: 19, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !13, line: 120, column: 13)
!98 = !DILocation(line: 120, column: 49, scope: !97)
!99 = !DILocation(line: 120, column: 13, scope: !97)
!100 = !DILocation(line: 120, column: 56, scope: !97)
!101 = !DILocation(line: 120, column: 13, scope: !94)
!102 = !DILocation(line: 123, column: 25, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !13, line: 121, column: 9)
!104 = !DILocation(line: 123, column: 20, scope: !103)
!105 = !DILocation(line: 123, column: 18, scope: !103)
!106 = !DILocation(line: 124, column: 9, scope: !103)
!107 = !DILocation(line: 127, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !13, line: 126, column: 9)
!109 = !DILocation(line: 130, column: 17, scope: !89)
!110 = !DILocation(line: 130, column: 5, scope: !89)
!111 = !DILocation(line: 131, column: 1, scope: !89)
!112 = distinct !DISubprogram(name: "goodB2GSink", scope: !13, file: !13, line: 96, type: !44, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !13, line: 96, type: !17)
!114 = !DILocation(line: 96, column: 29, scope: !112)
!115 = !DILocalVariable(name: "buffer", scope: !116, file: !13, line: 99, type: !50)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 98, column: 5)
!117 = !DILocation(line: 99, column: 13, scope: !116)
!118 = !DILocation(line: 101, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !13, line: 101, column: 13)
!120 = !DILocation(line: 101, column: 18, scope: !119)
!121 = !DILocation(line: 101, column: 23, scope: !119)
!122 = !DILocation(line: 101, column: 26, scope: !119)
!123 = !DILocation(line: 101, column: 31, scope: !119)
!124 = !DILocation(line: 101, column: 13, scope: !116)
!125 = !DILocation(line: 103, column: 33, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !13, line: 102, column: 9)
!127 = !DILocation(line: 103, column: 26, scope: !126)
!128 = !DILocation(line: 103, column: 13, scope: !126)
!129 = !DILocation(line: 104, column: 9, scope: !126)
!130 = !DILocation(line: 107, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !119, file: !13, line: 106, column: 9)
!132 = !DILocation(line: 110, column: 1, scope: !112)
!133 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 84, type: !14, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !13, line: 86, type: !17)
!135 = !DILocation(line: 86, column: 9, scope: !133)
!136 = !DILocation(line: 88, column: 10, scope: !133)
!137 = !DILocation(line: 91, column: 10, scope: !133)
!138 = !DILocation(line: 92, column: 17, scope: !133)
!139 = !DILocation(line: 92, column: 5, scope: !133)
!140 = !DILocation(line: 93, column: 1, scope: !133)
!141 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 67, type: !44, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", arg: 1, scope: !141, file: !13, line: 67, type: !17)
!143 = !DILocation(line: 67, column: 29, scope: !141)
!144 = !DILocalVariable(name: "buffer", scope: !145, file: !13, line: 70, type: !50)
!145 = distinct !DILexicalBlock(scope: !141, file: !13, line: 69, column: 5)
!146 = !DILocation(line: 70, column: 13, scope: !145)
!147 = !DILocation(line: 73, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !13, line: 73, column: 13)
!149 = !DILocation(line: 73, column: 18, scope: !148)
!150 = !DILocation(line: 73, column: 13, scope: !145)
!151 = !DILocation(line: 75, column: 33, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 74, column: 9)
!153 = !DILocation(line: 75, column: 26, scope: !152)
!154 = !DILocation(line: 75, column: 13, scope: !152)
!155 = !DILocation(line: 76, column: 9, scope: !152)
!156 = !DILocation(line: 79, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !148, file: !13, line: 78, column: 9)
!158 = !DILocation(line: 82, column: 1, scope: !141)
