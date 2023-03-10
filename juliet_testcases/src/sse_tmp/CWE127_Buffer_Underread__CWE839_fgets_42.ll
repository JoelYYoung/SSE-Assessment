; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_42.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_42_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  %0 = load i32, i32* %data, align 4, !dbg !20
  %call = call i32 @badSource(i32 %0), !dbg !21
  store i32 %call, i32* %data, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !28
  %2 = load i32, i32* %data, align 4, !dbg !29
  %cmp = icmp slt i32 %2, 10, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !33
  %idxprom = sext i32 %3 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !35
  %4 = load i32, i32* %arrayidx, align 4, !dbg !35
  call void @printIntLine(i32 %4), !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !46, metadata !DIExpression()), !dbg !52
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !52
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !53
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !55
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !56
  %cmp = icmp ne i8* %call, null, !dbg !57
  br i1 %cmp, label %if.then, label %if.else, !dbg !58

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !59
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !61
  store i32 %call2, i32* %data.addr, align 4, !dbg !62
  br label %if.end, !dbg !63

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0)), !dbg !64
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data.addr, align 4, !dbg !66
  ret i32 %2, !dbg !67
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_42_good() #0 !dbg !68 {
entry:
  call void @goodB2G(), !dbg !69
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #7, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #7, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__CWE839_fgets_42_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__CWE839_fgets_42_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !91 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32 -1, i32* %data, align 4, !dbg !94
  %0 = load i32, i32* %data, align 4, !dbg !95
  %call = call i32 @goodB2GSource(i32 %0), !dbg !96
  store i32 %call, i32* %data, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !98, metadata !DIExpression()), !dbg !100
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !100
  %2 = load i32, i32* %data, align 4, !dbg !101
  %cmp = icmp sge i32 %2, 0, !dbg !103
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !104

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !105
  %cmp1 = icmp slt i32 %3, 10, !dbg !106
  br i1 %cmp1, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !108
  %idxprom = sext i32 %4 to i64, !dbg !110
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !110
  %5 = load i32, i32* %arrayidx, align 4, !dbg !110
  call void @printIntLine(i32 %5), !dbg !111
  br label %if.end, !dbg !112

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !116 {
entry:
  %data.addr = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !117, metadata !DIExpression()), !dbg !118
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
  store i32 %call2, i32* %data.addr, align 4, !dbg !131
  br label %if.end, !dbg !132

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0)), !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data.addr, align 4, !dbg !135
  ret i32 %2, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !137 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !138, metadata !DIExpression()), !dbg !139
  store i32 -1, i32* %data, align 4, !dbg !140
  %0 = load i32, i32* %data, align 4, !dbg !141
  %call = call i32 @goodG2BSource(i32 %0), !dbg !142
  store i32 %call, i32* %data, align 4, !dbg !143
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !144, metadata !DIExpression()), !dbg !146
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !146
  %2 = load i32, i32* %data, align 4, !dbg !147
  %cmp = icmp slt i32 %2, 10, !dbg !149
  br i1 %cmp, label %if.then, label %if.else, !dbg !150

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !151
  %idxprom = sext i32 %3 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !153
  %4 = load i32, i32* %arrayidx, align 4, !dbg !153
  call void @printIntLine(i32 %4), !dbg !154
  br label %if.end, !dbg !155

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !156
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !159 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !160, metadata !DIExpression()), !dbg !161
  store i32 7, i32* %data.addr, align 4, !dbg !162
  %0 = load i32, i32* %data.addr, align 4, !dbg !163
  ret i32 %0, !dbg !164
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_42_bad", scope: !13, file: !13, line: 42, type: !14, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_42.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 44, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 44, column: 9, scope: !12)
!19 = !DILocation(line: 46, column: 10, scope: !12)
!20 = !DILocation(line: 47, column: 22, scope: !12)
!21 = !DILocation(line: 47, column: 12, scope: !12)
!22 = !DILocation(line: 47, column: 10, scope: !12)
!23 = !DILocalVariable(name: "buffer", scope: !24, file: !13, line: 49, type: !25)
!24 = distinct !DILexicalBlock(scope: !12, file: !13, line: 48, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 49, column: 13, scope: !24)
!29 = !DILocation(line: 52, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !24, file: !13, line: 52, column: 13)
!31 = !DILocation(line: 52, column: 18, scope: !30)
!32 = !DILocation(line: 52, column: 13, scope: !24)
!33 = !DILocation(line: 54, column: 33, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !13, line: 53, column: 9)
!35 = !DILocation(line: 54, column: 26, scope: !34)
!36 = !DILocation(line: 54, column: 13, scope: !34)
!37 = !DILocation(line: 55, column: 9, scope: !34)
!38 = !DILocation(line: 58, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !13, line: 57, column: 9)
!40 = !DILocation(line: 61, column: 1, scope: !12)
!41 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 24, type: !42, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!17, !17}
!44 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !13, line: 24, type: !17)
!45 = !DILocation(line: 24, column: 26, scope: !41)
!46 = !DILocalVariable(name: "inputBuffer", scope: !47, file: !13, line: 27, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !13, line: 26, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 112, elements: !50)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !{!51}
!51 = !DISubrange(count: 14)
!52 = !DILocation(line: 27, column: 14, scope: !47)
!53 = !DILocation(line: 29, column: 19, scope: !54)
!54 = distinct !DILexicalBlock(scope: !47, file: !13, line: 29, column: 13)
!55 = !DILocation(line: 29, column: 49, scope: !54)
!56 = !DILocation(line: 29, column: 13, scope: !54)
!57 = !DILocation(line: 29, column: 56, scope: !54)
!58 = !DILocation(line: 29, column: 13, scope: !47)
!59 = !DILocation(line: 32, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !13, line: 30, column: 9)
!61 = !DILocation(line: 32, column: 20, scope: !60)
!62 = !DILocation(line: 32, column: 18, scope: !60)
!63 = !DILocation(line: 33, column: 9, scope: !60)
!64 = !DILocation(line: 36, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !54, file: !13, line: 35, column: 9)
!66 = !DILocation(line: 39, column: 12, scope: !41)
!67 = !DILocation(line: 39, column: 5, scope: !41)
!68 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_42_good", scope: !13, file: !13, line: 136, type: !14, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 138, column: 5, scope: !68)
!70 = !DILocation(line: 139, column: 5, scope: !68)
!71 = !DILocation(line: 140, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 151, type: !73, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!17, !17, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !13, line: 151, type: !17)
!78 = !DILocation(line: 151, column: 14, scope: !72)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !13, line: 151, type: !75)
!80 = !DILocation(line: 151, column: 27, scope: !72)
!81 = !DILocation(line: 154, column: 22, scope: !72)
!82 = !DILocation(line: 154, column: 12, scope: !72)
!83 = !DILocation(line: 154, column: 5, scope: !72)
!84 = !DILocation(line: 156, column: 5, scope: !72)
!85 = !DILocation(line: 157, column: 5, scope: !72)
!86 = !DILocation(line: 158, column: 5, scope: !72)
!87 = !DILocation(line: 161, column: 5, scope: !72)
!88 = !DILocation(line: 162, column: 5, scope: !72)
!89 = !DILocation(line: 163, column: 5, scope: !72)
!90 = !DILocation(line: 165, column: 5, scope: !72)
!91 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 116, type: !14, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !13, line: 118, type: !17)
!93 = !DILocation(line: 118, column: 9, scope: !91)
!94 = !DILocation(line: 120, column: 10, scope: !91)
!95 = !DILocation(line: 121, column: 26, scope: !91)
!96 = !DILocation(line: 121, column: 12, scope: !91)
!97 = !DILocation(line: 121, column: 10, scope: !91)
!98 = !DILocalVariable(name: "buffer", scope: !99, file: !13, line: 123, type: !25)
!99 = distinct !DILexicalBlock(scope: !91, file: !13, line: 122, column: 5)
!100 = !DILocation(line: 123, column: 13, scope: !99)
!101 = !DILocation(line: 125, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !13, line: 125, column: 13)
!103 = !DILocation(line: 125, column: 18, scope: !102)
!104 = !DILocation(line: 125, column: 23, scope: !102)
!105 = !DILocation(line: 125, column: 26, scope: !102)
!106 = !DILocation(line: 125, column: 31, scope: !102)
!107 = !DILocation(line: 125, column: 13, scope: !99)
!108 = !DILocation(line: 127, column: 33, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !13, line: 126, column: 9)
!110 = !DILocation(line: 127, column: 26, scope: !109)
!111 = !DILocation(line: 127, column: 13, scope: !109)
!112 = !DILocation(line: 128, column: 9, scope: !109)
!113 = !DILocation(line: 131, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !102, file: !13, line: 130, column: 9)
!115 = !DILocation(line: 134, column: 1, scope: !91)
!116 = distinct !DISubprogram(name: "goodB2GSource", scope: !13, file: !13, line: 98, type: !42, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", arg: 1, scope: !116, file: !13, line: 98, type: !17)
!118 = !DILocation(line: 98, column: 30, scope: !116)
!119 = !DILocalVariable(name: "inputBuffer", scope: !120, file: !13, line: 101, type: !48)
!120 = distinct !DILexicalBlock(scope: !116, file: !13, line: 100, column: 5)
!121 = !DILocation(line: 101, column: 14, scope: !120)
!122 = !DILocation(line: 103, column: 19, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !13, line: 103, column: 13)
!124 = !DILocation(line: 103, column: 49, scope: !123)
!125 = !DILocation(line: 103, column: 13, scope: !123)
!126 = !DILocation(line: 103, column: 56, scope: !123)
!127 = !DILocation(line: 103, column: 13, scope: !120)
!128 = !DILocation(line: 106, column: 25, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !13, line: 104, column: 9)
!130 = !DILocation(line: 106, column: 20, scope: !129)
!131 = !DILocation(line: 106, column: 18, scope: !129)
!132 = !DILocation(line: 107, column: 9, scope: !129)
!133 = !DILocation(line: 110, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !123, file: !13, line: 109, column: 9)
!135 = !DILocation(line: 113, column: 12, scope: !116)
!136 = !DILocation(line: 113, column: 5, scope: !116)
!137 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 76, type: !14, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !13, line: 78, type: !17)
!139 = !DILocation(line: 78, column: 9, scope: !137)
!140 = !DILocation(line: 80, column: 10, scope: !137)
!141 = !DILocation(line: 81, column: 26, scope: !137)
!142 = !DILocation(line: 81, column: 12, scope: !137)
!143 = !DILocation(line: 81, column: 10, scope: !137)
!144 = !DILocalVariable(name: "buffer", scope: !145, file: !13, line: 83, type: !25)
!145 = distinct !DILexicalBlock(scope: !137, file: !13, line: 82, column: 5)
!146 = !DILocation(line: 83, column: 13, scope: !145)
!147 = !DILocation(line: 86, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !13, line: 86, column: 13)
!149 = !DILocation(line: 86, column: 18, scope: !148)
!150 = !DILocation(line: 86, column: 13, scope: !145)
!151 = !DILocation(line: 88, column: 33, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 87, column: 9)
!153 = !DILocation(line: 88, column: 26, scope: !152)
!154 = !DILocation(line: 88, column: 13, scope: !152)
!155 = !DILocation(line: 89, column: 9, scope: !152)
!156 = !DILocation(line: 92, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !148, file: !13, line: 91, column: 9)
!158 = !DILocation(line: 95, column: 1, scope: !137)
!159 = distinct !DISubprogram(name: "goodG2BSource", scope: !13, file: !13, line: 68, type: !42, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DILocalVariable(name: "data", arg: 1, scope: !159, file: !13, line: 68, type: !17)
!161 = !DILocation(line: 68, column: 30, scope: !159)
!162 = !DILocation(line: 72, column: 10, scope: !159)
!163 = !DILocation(line: 73, column: 12, scope: !159)
!164 = !DILocation(line: 73, column: 5, scope: !159)
