; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !29
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %4 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !38
  store i32* %add.ptr, i32** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx2, align 4, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !54
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !55
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx7, align 4, !dbg !57
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay8), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 400, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBuffer, align 8, !dbg !89
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !93
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  %4 = load i32, i32* @staticFive, align 4, !dbg !96
  %cmp = icmp ne i32 %4, 5, !dbg !98
  br i1 %cmp, label %if.then, label %if.else, !dbg !99

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !100
  br label %if.end, !dbg !102

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  store i32* %5, i32** %data, align 8, !dbg !105
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !110
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx2, align 4, !dbg !112
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !116
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !117
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx7, align 4, !dbg !119
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  call void @printWLine(i32* %arraydecay8), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = alloca i8, i64 400, align 16, !dbg !128
  %1 = bitcast i8* %0 to i32*, !dbg !129
  store i32* %1, i32** %dataBuffer, align 8, !dbg !127
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !131
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %4 = load i32, i32* @staticFive, align 4, !dbg !134
  %cmp = icmp eq i32 %4, 5, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  store i32* %5, i32** %data, align 8, !dbg !140
  br label %if.end, !dbg !141

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !146
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx2, align 4, !dbg !148
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  %6 = load i32*, i32** %data, align 8, !dbg !150
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !152
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !153
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx7, align 4, !dbg !155
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !156
  call void @printWLine(i32* %arraydecay8), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 39, scope: !19)
!27 = !DILocation(line: 32, column: 28, scope: !19)
!28 = !DILocation(line: 33, column: 13, scope: !19)
!29 = !DILocation(line: 33, column: 5, scope: !19)
!30 = !DILocation(line: 34, column: 5, scope: !19)
!31 = !DILocation(line: 34, column: 23, scope: !19)
!32 = !DILocation(line: 35, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 35, column: 8)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 8, scope: !19)
!36 = !DILocation(line: 38, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 36, column: 5)
!38 = !DILocation(line: 38, column: 27, scope: !37)
!39 = !DILocation(line: 38, column: 14, scope: !37)
!40 = !DILocation(line: 39, column: 5, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !19, file: !12, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocation(line: 42, column: 17, scope: !42)
!48 = !DILocation(line: 42, column: 9, scope: !42)
!49 = !DILocation(line: 43, column: 9, scope: !42)
!50 = !DILocation(line: 43, column: 21, scope: !42)
!51 = !DILocation(line: 45, column: 17, scope: !42)
!52 = !DILocation(line: 45, column: 23, scope: !42)
!53 = !DILocation(line: 45, column: 36, scope: !42)
!54 = !DILocation(line: 45, column: 29, scope: !42)
!55 = !DILocation(line: 45, column: 9, scope: !42)
!56 = !DILocation(line: 47, column: 9, scope: !42)
!57 = !DILocation(line: 47, column: 21, scope: !42)
!58 = !DILocation(line: 48, column: 20, scope: !42)
!59 = !DILocation(line: 48, column: 9, scope: !42)
!60 = !DILocation(line: 50, column: 1, scope: !19)
!61 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_07_good", scope: !12, file: !12, line: 109, type: !20, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 111, column: 5, scope: !61)
!63 = !DILocation(line: 112, column: 5, scope: !61)
!64 = !DILocation(line: 113, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !66, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!9, !9, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 125, type: !9)
!72 = !DILocation(line: 125, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 125, type: !68)
!74 = !DILocation(line: 125, column: 27, scope: !65)
!75 = !DILocation(line: 128, column: 22, scope: !65)
!76 = !DILocation(line: 128, column: 12, scope: !65)
!77 = !DILocation(line: 128, column: 5, scope: !65)
!78 = !DILocation(line: 130, column: 5, scope: !65)
!79 = !DILocation(line: 131, column: 5, scope: !65)
!80 = !DILocation(line: 132, column: 5, scope: !65)
!81 = !DILocation(line: 135, column: 5, scope: !65)
!82 = !DILocation(line: 136, column: 5, scope: !65)
!83 = !DILocation(line: 137, column: 5, scope: !65)
!84 = !DILocation(line: 139, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 59, type: !6)
!87 = !DILocation(line: 59, column: 15, scope: !85)
!88 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !12, line: 60, type: !6)
!89 = !DILocation(line: 60, column: 15, scope: !85)
!90 = !DILocation(line: 60, column: 39, scope: !85)
!91 = !DILocation(line: 60, column: 28, scope: !85)
!92 = !DILocation(line: 61, column: 13, scope: !85)
!93 = !DILocation(line: 61, column: 5, scope: !85)
!94 = !DILocation(line: 62, column: 5, scope: !85)
!95 = !DILocation(line: 62, column: 23, scope: !85)
!96 = !DILocation(line: 63, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !85, file: !12, line: 63, column: 8)
!98 = !DILocation(line: 63, column: 18, scope: !97)
!99 = !DILocation(line: 63, column: 8, scope: !85)
!100 = !DILocation(line: 66, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 64, column: 5)
!102 = !DILocation(line: 67, column: 5, scope: !101)
!103 = !DILocation(line: 71, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !12, line: 69, column: 5)
!105 = !DILocation(line: 71, column: 14, scope: !104)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !12, line: 74, type: !43)
!107 = distinct !DILexicalBlock(scope: !85, file: !12, line: 73, column: 5)
!108 = !DILocation(line: 74, column: 17, scope: !107)
!109 = !DILocation(line: 75, column: 17, scope: !107)
!110 = !DILocation(line: 75, column: 9, scope: !107)
!111 = !DILocation(line: 76, column: 9, scope: !107)
!112 = !DILocation(line: 76, column: 21, scope: !107)
!113 = !DILocation(line: 78, column: 17, scope: !107)
!114 = !DILocation(line: 78, column: 23, scope: !107)
!115 = !DILocation(line: 78, column: 36, scope: !107)
!116 = !DILocation(line: 78, column: 29, scope: !107)
!117 = !DILocation(line: 78, column: 9, scope: !107)
!118 = !DILocation(line: 80, column: 9, scope: !107)
!119 = !DILocation(line: 80, column: 21, scope: !107)
!120 = !DILocation(line: 81, column: 20, scope: !107)
!121 = !DILocation(line: 81, column: 9, scope: !107)
!122 = !DILocation(line: 83, column: 1, scope: !85)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 88, type: !6)
!125 = !DILocation(line: 88, column: 15, scope: !123)
!126 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !12, line: 89, type: !6)
!127 = !DILocation(line: 89, column: 15, scope: !123)
!128 = !DILocation(line: 89, column: 39, scope: !123)
!129 = !DILocation(line: 89, column: 28, scope: !123)
!130 = !DILocation(line: 90, column: 13, scope: !123)
!131 = !DILocation(line: 90, column: 5, scope: !123)
!132 = !DILocation(line: 91, column: 5, scope: !123)
!133 = !DILocation(line: 91, column: 23, scope: !123)
!134 = !DILocation(line: 92, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !123, file: !12, line: 92, column: 8)
!136 = !DILocation(line: 92, column: 18, scope: !135)
!137 = !DILocation(line: 92, column: 8, scope: !123)
!138 = !DILocation(line: 95, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !12, line: 93, column: 5)
!140 = !DILocation(line: 95, column: 14, scope: !139)
!141 = !DILocation(line: 96, column: 5, scope: !139)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !12, line: 98, type: !43)
!143 = distinct !DILexicalBlock(scope: !123, file: !12, line: 97, column: 5)
!144 = !DILocation(line: 98, column: 17, scope: !143)
!145 = !DILocation(line: 99, column: 17, scope: !143)
!146 = !DILocation(line: 99, column: 9, scope: !143)
!147 = !DILocation(line: 100, column: 9, scope: !143)
!148 = !DILocation(line: 100, column: 21, scope: !143)
!149 = !DILocation(line: 102, column: 17, scope: !143)
!150 = !DILocation(line: 102, column: 23, scope: !143)
!151 = !DILocation(line: 102, column: 36, scope: !143)
!152 = !DILocation(line: 102, column: 29, scope: !143)
!153 = !DILocation(line: 102, column: 9, scope: !143)
!154 = !DILocation(line: 104, column: 9, scope: !143)
!155 = !DILocation(line: 104, column: 21, scope: !143)
!156 = !DILocation(line: 105, column: 20, scope: !143)
!157 = !DILocation(line: 105, column: 9, scope: !143)
!158 = !DILocation(line: 107, column: 1, scope: !123)
