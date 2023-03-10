; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %4, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx2, align 4, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !55
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !56
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx7, align 4, !dbg !58
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* %arraydecay8), !dbg !60
  ret void, !dbg !61
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 400, align 16, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  store i32* %1, i32** %dataBuffer, align 8, !dbg !90
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !94
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %4 = load i32, i32* @staticFalse, align 4, !dbg !97
  %tobool = icmp ne i32 %4, 0, !dbg !97
  br i1 %tobool, label %if.then, label %if.else, !dbg !99

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
  %4 = load i32, i32* @staticTrue, align 4, !dbg !134
  %tobool = icmp ne i32 %4, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !137
  store i32* %5, i32** %data, align 8, !dbg !139
  br label %if.end, !dbg !140

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !145
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx2, align 4, !dbg !147
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %6 = load i32*, i32** %data, align 8, !dbg !149
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !151
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %6, i64 %call5) #5, !dbg !152
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx7, align 4, !dbg !154
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  call void @printWLine(i32* %arraydecay8), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 39, scope: !21)
!29 = !DILocation(line: 33, column: 28, scope: !21)
!30 = !DILocation(line: 34, column: 13, scope: !21)
!31 = !DILocation(line: 34, column: 5, scope: !21)
!32 = !DILocation(line: 35, column: 5, scope: !21)
!33 = !DILocation(line: 35, column: 23, scope: !21)
!34 = !DILocation(line: 36, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 36, column: 8)
!36 = !DILocation(line: 36, column: 8, scope: !21)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 37, column: 5)
!39 = !DILocation(line: 39, column: 27, scope: !38)
!40 = !DILocation(line: 39, column: 14, scope: !38)
!41 = !DILocation(line: 40, column: 5, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !14, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !21, file: !14, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 42, column: 17, scope: !43)
!48 = !DILocation(line: 43, column: 17, scope: !43)
!49 = !DILocation(line: 43, column: 9, scope: !43)
!50 = !DILocation(line: 44, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 21, scope: !43)
!52 = !DILocation(line: 46, column: 17, scope: !43)
!53 = !DILocation(line: 46, column: 23, scope: !43)
!54 = !DILocation(line: 46, column: 36, scope: !43)
!55 = !DILocation(line: 46, column: 29, scope: !43)
!56 = !DILocation(line: 46, column: 9, scope: !43)
!57 = !DILocation(line: 48, column: 9, scope: !43)
!58 = !DILocation(line: 48, column: 21, scope: !43)
!59 = !DILocation(line: 49, column: 20, scope: !43)
!60 = !DILocation(line: 49, column: 9, scope: !43)
!61 = !DILocation(line: 51, column: 1, scope: !21)
!62 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_05_good", scope: !14, file: !14, line: 110, type: !22, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocation(line: 112, column: 5, scope: !62)
!64 = !DILocation(line: 113, column: 5, scope: !62)
!65 = !DILocation(line: 114, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 126, type: !67, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!9, !9, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !14, line: 126, type: !9)
!73 = !DILocation(line: 126, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !14, line: 126, type: !69)
!75 = !DILocation(line: 126, column: 27, scope: !66)
!76 = !DILocation(line: 129, column: 22, scope: !66)
!77 = !DILocation(line: 129, column: 12, scope: !66)
!78 = !DILocation(line: 129, column: 5, scope: !66)
!79 = !DILocation(line: 131, column: 5, scope: !66)
!80 = !DILocation(line: 132, column: 5, scope: !66)
!81 = !DILocation(line: 133, column: 5, scope: !66)
!82 = !DILocation(line: 136, column: 5, scope: !66)
!83 = !DILocation(line: 137, column: 5, scope: !66)
!84 = !DILocation(line: 138, column: 5, scope: !66)
!85 = !DILocation(line: 140, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 60, type: !6)
!88 = !DILocation(line: 60, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !14, line: 61, type: !6)
!90 = !DILocation(line: 61, column: 15, scope: !86)
!91 = !DILocation(line: 61, column: 39, scope: !86)
!92 = !DILocation(line: 61, column: 28, scope: !86)
!93 = !DILocation(line: 62, column: 13, scope: !86)
!94 = !DILocation(line: 62, column: 5, scope: !86)
!95 = !DILocation(line: 63, column: 5, scope: !86)
!96 = !DILocation(line: 63, column: 23, scope: !86)
!97 = !DILocation(line: 64, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !86, file: !14, line: 64, column: 8)
!99 = !DILocation(line: 64, column: 8, scope: !86)
!100 = !DILocation(line: 67, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !14, line: 65, column: 5)
!102 = !DILocation(line: 68, column: 5, scope: !101)
!103 = !DILocation(line: 72, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !14, line: 70, column: 5)
!105 = !DILocation(line: 72, column: 14, scope: !104)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !14, line: 75, type: !44)
!107 = distinct !DILexicalBlock(scope: !86, file: !14, line: 74, column: 5)
!108 = !DILocation(line: 75, column: 17, scope: !107)
!109 = !DILocation(line: 76, column: 17, scope: !107)
!110 = !DILocation(line: 76, column: 9, scope: !107)
!111 = !DILocation(line: 77, column: 9, scope: !107)
!112 = !DILocation(line: 77, column: 21, scope: !107)
!113 = !DILocation(line: 79, column: 17, scope: !107)
!114 = !DILocation(line: 79, column: 23, scope: !107)
!115 = !DILocation(line: 79, column: 36, scope: !107)
!116 = !DILocation(line: 79, column: 29, scope: !107)
!117 = !DILocation(line: 79, column: 9, scope: !107)
!118 = !DILocation(line: 81, column: 9, scope: !107)
!119 = !DILocation(line: 81, column: 21, scope: !107)
!120 = !DILocation(line: 82, column: 20, scope: !107)
!121 = !DILocation(line: 82, column: 9, scope: !107)
!122 = !DILocation(line: 84, column: 1, scope: !86)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !14, line: 89, type: !6)
!125 = !DILocation(line: 89, column: 15, scope: !123)
!126 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !14, line: 90, type: !6)
!127 = !DILocation(line: 90, column: 15, scope: !123)
!128 = !DILocation(line: 90, column: 39, scope: !123)
!129 = !DILocation(line: 90, column: 28, scope: !123)
!130 = !DILocation(line: 91, column: 13, scope: !123)
!131 = !DILocation(line: 91, column: 5, scope: !123)
!132 = !DILocation(line: 92, column: 5, scope: !123)
!133 = !DILocation(line: 92, column: 23, scope: !123)
!134 = !DILocation(line: 93, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !123, file: !14, line: 93, column: 8)
!136 = !DILocation(line: 93, column: 8, scope: !123)
!137 = !DILocation(line: 96, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !14, line: 94, column: 5)
!139 = !DILocation(line: 96, column: 14, scope: !138)
!140 = !DILocation(line: 97, column: 5, scope: !138)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !14, line: 99, type: !44)
!142 = distinct !DILexicalBlock(scope: !123, file: !14, line: 98, column: 5)
!143 = !DILocation(line: 99, column: 17, scope: !142)
!144 = !DILocation(line: 100, column: 17, scope: !142)
!145 = !DILocation(line: 100, column: 9, scope: !142)
!146 = !DILocation(line: 101, column: 9, scope: !142)
!147 = !DILocation(line: 101, column: 21, scope: !142)
!148 = !DILocation(line: 103, column: 17, scope: !142)
!149 = !DILocation(line: 103, column: 23, scope: !142)
!150 = !DILocation(line: 103, column: 36, scope: !142)
!151 = !DILocation(line: 103, column: 29, scope: !142)
!152 = !DILocation(line: 103, column: 9, scope: !142)
!153 = !DILocation(line: 105, column: 9, scope: !142)
!154 = !DILocation(line: 105, column: 21, scope: !142)
!155 = !DILocation(line: 106, column: 20, scope: !142)
!156 = !DILocation(line: 106, column: 9, scope: !142)
!157 = !DILocation(line: 108, column: 1, scope: !123)
