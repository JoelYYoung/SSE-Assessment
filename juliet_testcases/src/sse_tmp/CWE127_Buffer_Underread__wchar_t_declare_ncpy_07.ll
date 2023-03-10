; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !46
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx4, align 4, !dbg !48
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !52
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %1, i64 %call7) #5, !dbg !53
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx9, align 4, !dbg !55
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay10), !dbg !57
  ret void, !dbg !58
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_07_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_07_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_07_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !88
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !89
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %0 = load i32, i32* @staticFive, align 4, !dbg !92
  %cmp = icmp ne i32 %0, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay1, i32** %data, align 8, !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !106
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx4, align 4, !dbg !108
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !111
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !112
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %1, i64 %call7) #5, !dbg !113
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx9, align 4, !dbg !115
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  call void @printWLine(i32* %arraydecay10), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !124
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !125
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %0 = load i32, i32* @staticFive, align 4, !dbg !128
  %cmp = icmp eq i32 %0, 5, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !132
  store i32* %arraydecay1, i32** %data, align 8, !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !140
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx4, align 4, !dbg !142
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %1 = load i32*, i32** %data, align 8, !dbg !144
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !146
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %1, i64 %call7) #5, !dbg !147
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx9, align 4, !dbg !149
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  call void @printWLine(i32* %arraydecay10), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocation(line: 33, column: 13, scope: !16)
!30 = !DILocation(line: 33, column: 5, scope: !16)
!31 = !DILocation(line: 34, column: 5, scope: !16)
!32 = !DILocation(line: 34, column: 23, scope: !16)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 18, scope: !34)
!36 = !DILocation(line: 35, column: 8, scope: !16)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 36, column: 5)
!39 = !DILocation(line: 38, column: 27, scope: !38)
!40 = !DILocation(line: 38, column: 14, scope: !38)
!41 = !DILocation(line: 39, column: 5, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !8, line: 41, type: !25)
!43 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!44 = !DILocation(line: 41, column: 17, scope: !43)
!45 = !DILocation(line: 42, column: 17, scope: !43)
!46 = !DILocation(line: 42, column: 9, scope: !43)
!47 = !DILocation(line: 43, column: 9, scope: !43)
!48 = !DILocation(line: 43, column: 21, scope: !43)
!49 = !DILocation(line: 45, column: 17, scope: !43)
!50 = !DILocation(line: 45, column: 23, scope: !43)
!51 = !DILocation(line: 45, column: 36, scope: !43)
!52 = !DILocation(line: 45, column: 29, scope: !43)
!53 = !DILocation(line: 45, column: 9, scope: !43)
!54 = !DILocation(line: 47, column: 9, scope: !43)
!55 = !DILocation(line: 47, column: 21, scope: !43)
!56 = !DILocation(line: 48, column: 20, scope: !43)
!57 = !DILocation(line: 48, column: 9, scope: !43)
!58 = !DILocation(line: 50, column: 1, scope: !16)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_07_good", scope: !8, file: !8, line: 109, type: !17, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 111, column: 5, scope: !59)
!61 = !DILocation(line: 112, column: 5, scope: !59)
!62 = !DILocation(line: 113, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 125, type: !64, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!9, !9, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !8, line: 125, type: !9)
!70 = !DILocation(line: 125, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !8, line: 125, type: !66)
!72 = !DILocation(line: 125, column: 27, scope: !63)
!73 = !DILocation(line: 128, column: 22, scope: !63)
!74 = !DILocation(line: 128, column: 12, scope: !63)
!75 = !DILocation(line: 128, column: 5, scope: !63)
!76 = !DILocation(line: 130, column: 5, scope: !63)
!77 = !DILocation(line: 131, column: 5, scope: !63)
!78 = !DILocation(line: 132, column: 5, scope: !63)
!79 = !DILocation(line: 135, column: 5, scope: !63)
!80 = !DILocation(line: 136, column: 5, scope: !63)
!81 = !DILocation(line: 137, column: 5, scope: !63)
!82 = !DILocation(line: 139, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !8, line: 59, type: !20)
!85 = !DILocation(line: 59, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !8, line: 60, type: !25)
!87 = !DILocation(line: 60, column: 13, scope: !83)
!88 = !DILocation(line: 61, column: 13, scope: !83)
!89 = !DILocation(line: 61, column: 5, scope: !83)
!90 = !DILocation(line: 62, column: 5, scope: !83)
!91 = !DILocation(line: 62, column: 23, scope: !83)
!92 = !DILocation(line: 63, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !8, line: 63, column: 8)
!94 = !DILocation(line: 63, column: 18, scope: !93)
!95 = !DILocation(line: 63, column: 8, scope: !83)
!96 = !DILocation(line: 66, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !8, line: 64, column: 5)
!98 = !DILocation(line: 67, column: 5, scope: !97)
!99 = !DILocation(line: 71, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !8, line: 69, column: 5)
!101 = !DILocation(line: 71, column: 14, scope: !100)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !8, line: 74, type: !25)
!103 = distinct !DILexicalBlock(scope: !83, file: !8, line: 73, column: 5)
!104 = !DILocation(line: 74, column: 17, scope: !103)
!105 = !DILocation(line: 75, column: 17, scope: !103)
!106 = !DILocation(line: 75, column: 9, scope: !103)
!107 = !DILocation(line: 76, column: 9, scope: !103)
!108 = !DILocation(line: 76, column: 21, scope: !103)
!109 = !DILocation(line: 78, column: 17, scope: !103)
!110 = !DILocation(line: 78, column: 23, scope: !103)
!111 = !DILocation(line: 78, column: 36, scope: !103)
!112 = !DILocation(line: 78, column: 29, scope: !103)
!113 = !DILocation(line: 78, column: 9, scope: !103)
!114 = !DILocation(line: 80, column: 9, scope: !103)
!115 = !DILocation(line: 80, column: 21, scope: !103)
!116 = !DILocation(line: 81, column: 20, scope: !103)
!117 = !DILocation(line: 81, column: 9, scope: !103)
!118 = !DILocation(line: 83, column: 1, scope: !83)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", scope: !119, file: !8, line: 88, type: !20)
!121 = !DILocation(line: 88, column: 15, scope: !119)
!122 = !DILocalVariable(name: "dataBuffer", scope: !119, file: !8, line: 89, type: !25)
!123 = !DILocation(line: 89, column: 13, scope: !119)
!124 = !DILocation(line: 90, column: 13, scope: !119)
!125 = !DILocation(line: 90, column: 5, scope: !119)
!126 = !DILocation(line: 91, column: 5, scope: !119)
!127 = !DILocation(line: 91, column: 23, scope: !119)
!128 = !DILocation(line: 92, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !119, file: !8, line: 92, column: 8)
!130 = !DILocation(line: 92, column: 18, scope: !129)
!131 = !DILocation(line: 92, column: 8, scope: !119)
!132 = !DILocation(line: 95, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !8, line: 93, column: 5)
!134 = !DILocation(line: 95, column: 14, scope: !133)
!135 = !DILocation(line: 96, column: 5, scope: !133)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !8, line: 98, type: !25)
!137 = distinct !DILexicalBlock(scope: !119, file: !8, line: 97, column: 5)
!138 = !DILocation(line: 98, column: 17, scope: !137)
!139 = !DILocation(line: 99, column: 17, scope: !137)
!140 = !DILocation(line: 99, column: 9, scope: !137)
!141 = !DILocation(line: 100, column: 9, scope: !137)
!142 = !DILocation(line: 100, column: 21, scope: !137)
!143 = !DILocation(line: 102, column: 17, scope: !137)
!144 = !DILocation(line: 102, column: 23, scope: !137)
!145 = !DILocation(line: 102, column: 36, scope: !137)
!146 = !DILocation(line: 102, column: 29, scope: !137)
!147 = !DILocation(line: 102, column: 9, scope: !137)
!148 = !DILocation(line: 104, column: 9, scope: !137)
!149 = !DILocation(line: 104, column: 21, scope: !137)
!150 = !DILocation(line: 105, column: 20, scope: !137)
!151 = !DILocation(line: 105, column: 9, scope: !137)
!152 = !DILocation(line: 107, column: 1, scope: !119)
