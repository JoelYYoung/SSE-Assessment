; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memmove_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !33
  store i8* %add.ptr, i8** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx3, align 1, !dbg !41
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  %1 = load i8*, i8** %data, align 8, !dbg !43
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %1, i64 100, i1 false), !dbg !42
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx5, align 1, !dbg !45
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @printLine(i8* %arraydecay6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memmove_13_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #6, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #6, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE127_Buffer_Underread__char_declare_memmove_13_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE127_Buffer_Underread__char_declare_memmove_13_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !77
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !80
  %cmp = icmp ne i32 %0, 5, !dbg !82
  br i1 %cmp, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay1, i8** %data, align 8, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !93
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx3, align 1, !dbg !95
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  %1 = load i8*, i8** %data, align 8, !dbg !97
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %1, i64 100, i1 false), !dbg !96
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx5, align 1, !dbg !99
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  call void @printLine(i8* %arraydecay6), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !108
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !111
  %cmp = icmp eq i32 %0, 5, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !115
  store i8* %arraydecay1, i8** %data, align 8, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !122
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx3, align 1, !dbg !124
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  %1 = load i8*, i8** %data, align 8, !dbg !126
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %1, i64 100, i1 false), !dbg !125
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx5, align 1, !dbg !128
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @printLine(i8* %arraydecay6), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memmove_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_13.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 29, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!29 = !DILocation(line: 29, column: 25, scope: !28)
!30 = !DILocation(line: 29, column: 8, scope: !11)
!31 = !DILocation(line: 32, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!33 = !DILocation(line: 32, column: 27, scope: !32)
!34 = !DILocation(line: 32, column: 14, scope: !32)
!35 = !DILocation(line: 33, column: 5, scope: !32)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 35, type: !20)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 9, scope: !37)
!40 = !DILocation(line: 37, column: 9, scope: !37)
!41 = !DILocation(line: 37, column: 21, scope: !37)
!42 = !DILocation(line: 39, column: 9, scope: !37)
!43 = !DILocation(line: 39, column: 23, scope: !37)
!44 = !DILocation(line: 41, column: 9, scope: !37)
!45 = !DILocation(line: 41, column: 21, scope: !37)
!46 = !DILocation(line: 42, column: 19, scope: !37)
!47 = !DILocation(line: 42, column: 9, scope: !37)
!48 = !DILocation(line: 44, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memmove_13_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 105, column: 5, scope: !49)
!51 = !DILocation(line: 106, column: 5, scope: !49)
!52 = !DILocation(line: 107, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !54, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 119, type: !56)
!59 = !DILocation(line: 119, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 119, type: !57)
!61 = !DILocation(line: 119, column: 27, scope: !53)
!62 = !DILocation(line: 122, column: 22, scope: !53)
!63 = !DILocation(line: 122, column: 12, scope: !53)
!64 = !DILocation(line: 122, column: 5, scope: !53)
!65 = !DILocation(line: 124, column: 5, scope: !53)
!66 = !DILocation(line: 125, column: 5, scope: !53)
!67 = !DILocation(line: 126, column: 5, scope: !53)
!68 = !DILocation(line: 129, column: 5, scope: !53)
!69 = !DILocation(line: 130, column: 5, scope: !53)
!70 = !DILocation(line: 131, column: 5, scope: !53)
!71 = !DILocation(line: 133, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 53, type: !16)
!74 = !DILocation(line: 53, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !12, line: 54, type: !20)
!76 = !DILocation(line: 54, column: 10, scope: !72)
!77 = !DILocation(line: 55, column: 5, scope: !72)
!78 = !DILocation(line: 56, column: 5, scope: !72)
!79 = !DILocation(line: 56, column: 23, scope: !72)
!80 = !DILocation(line: 57, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !12, line: 57, column: 8)
!82 = !DILocation(line: 57, column: 25, scope: !81)
!83 = !DILocation(line: 57, column: 8, scope: !72)
!84 = !DILocation(line: 60, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !12, line: 58, column: 5)
!86 = !DILocation(line: 61, column: 5, scope: !85)
!87 = !DILocation(line: 65, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !12, line: 63, column: 5)
!89 = !DILocation(line: 65, column: 14, scope: !88)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !12, line: 68, type: !20)
!91 = distinct !DILexicalBlock(scope: !72, file: !12, line: 67, column: 5)
!92 = !DILocation(line: 68, column: 14, scope: !91)
!93 = !DILocation(line: 69, column: 9, scope: !91)
!94 = !DILocation(line: 70, column: 9, scope: !91)
!95 = !DILocation(line: 70, column: 21, scope: !91)
!96 = !DILocation(line: 72, column: 9, scope: !91)
!97 = !DILocation(line: 72, column: 23, scope: !91)
!98 = !DILocation(line: 74, column: 9, scope: !91)
!99 = !DILocation(line: 74, column: 21, scope: !91)
!100 = !DILocation(line: 75, column: 19, scope: !91)
!101 = !DILocation(line: 75, column: 9, scope: !91)
!102 = !DILocation(line: 77, column: 1, scope: !72)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 82, type: !16)
!105 = !DILocation(line: 82, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !12, line: 83, type: !20)
!107 = !DILocation(line: 83, column: 10, scope: !103)
!108 = !DILocation(line: 84, column: 5, scope: !103)
!109 = !DILocation(line: 85, column: 5, scope: !103)
!110 = !DILocation(line: 85, column: 23, scope: !103)
!111 = !DILocation(line: 86, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !103, file: !12, line: 86, column: 8)
!113 = !DILocation(line: 86, column: 25, scope: !112)
!114 = !DILocation(line: 86, column: 8, scope: !103)
!115 = !DILocation(line: 89, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 87, column: 5)
!117 = !DILocation(line: 89, column: 14, scope: !116)
!118 = !DILocation(line: 90, column: 5, scope: !116)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 92, type: !20)
!120 = distinct !DILexicalBlock(scope: !103, file: !12, line: 91, column: 5)
!121 = !DILocation(line: 92, column: 14, scope: !120)
!122 = !DILocation(line: 93, column: 9, scope: !120)
!123 = !DILocation(line: 94, column: 9, scope: !120)
!124 = !DILocation(line: 94, column: 21, scope: !120)
!125 = !DILocation(line: 96, column: 9, scope: !120)
!126 = !DILocation(line: 96, column: 23, scope: !120)
!127 = !DILocation(line: 98, column: 9, scope: !120)
!128 = !DILocation(line: 98, column: 21, scope: !120)
!129 = !DILocation(line: 99, column: 19, scope: !120)
!130 = !DILocation(line: 99, column: 9, scope: !120)
!131 = !DILocation(line: 101, column: 1, scope: !103)
