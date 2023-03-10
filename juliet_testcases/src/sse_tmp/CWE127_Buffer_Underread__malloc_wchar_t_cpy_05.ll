; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end3, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !35
  %1 = bitcast i8* %call to i32*, !dbg !36
  store i32* %1, i32** %dataBuffer, align 8, !dbg !34
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %cmp = icmp eq i32* %2, null, !dbg !39
  br i1 %cmp, label %if.then1, label %if.end, !dbg !40

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !44
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !47
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !48
  store i32* %add.ptr, i32** %data, align 8, !dbg !49
  br label %if.end3, !dbg !50

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !58
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !59
  store i32 0, i32* %arrayidx5, align 4, !dbg !60
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !61
  %6 = load i32*, i32** %data, align 8, !dbg !62
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %6) #5, !dbg !63
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay8), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_05_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_05_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_05_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %0 = load i32, i32* @staticFalse, align 4, !dbg !95
  %tobool = icmp ne i32 %0, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end3, !dbg !100

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !104
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !105
  %1 = bitcast i8* %call to i32*, !dbg !106
  store i32* %1, i32** %dataBuffer, align 8, !dbg !104
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %cmp = icmp eq i32* %2, null, !dbg !109
  br i1 %cmp, label %if.then1, label %if.end, !dbg !110

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !114
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  store i32* %5, i32** %data, align 8, !dbg !118
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !123
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !124
  store i32 0, i32* %arrayidx5, align 4, !dbg !125
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !126
  %6 = load i32*, i32** %data, align 8, !dbg !127
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %6) #5, !dbg !128
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* %arraydecay8), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !132 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !133, metadata !DIExpression()), !dbg !134
  store i32* null, i32** %data, align 8, !dbg !135
  %0 = load i32, i32* @staticTrue, align 4, !dbg !136
  %tobool = icmp ne i32 %0, 0, !dbg !136
  br i1 %tobool, label %if.then, label %if.end3, !dbg !138

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !139, metadata !DIExpression()), !dbg !142
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !143
  %1 = bitcast i8* %call to i32*, !dbg !144
  store i32* %1, i32** %dataBuffer, align 8, !dbg !142
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !145
  %cmp = icmp eq i32* %2, null, !dbg !147
  br i1 %cmp, label %if.then1, label %if.end, !dbg !148

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !149
  unreachable, !dbg !149

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !151
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !152
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !153
  store i32 0, i32* %arrayidx, align 4, !dbg !154
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !155
  store i32* %5, i32** %data, align 8, !dbg !156
  br label %if.end3, !dbg !157

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !158, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !161
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !162
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !163
  store i32 0, i32* %arrayidx5, align 4, !dbg !164
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !165
  %6 = load i32*, i32** %data, align 8, !dbg !166
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %6) #5, !dbg !167
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !168
  call void @printWLine(i32* %arraydecay8), !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 10, scope: !22)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !22)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !15, line: 37, type: !6)
!32 = distinct !DILexicalBlock(scope: !33, file: !15, line: 36, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!34 = !DILocation(line: 37, column: 23, scope: !32)
!35 = !DILocation(line: 37, column: 47, scope: !32)
!36 = !DILocation(line: 37, column: 36, scope: !32)
!37 = !DILocation(line: 38, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 17)
!39 = !DILocation(line: 38, column: 28, scope: !38)
!40 = !DILocation(line: 38, column: 17, scope: !32)
!41 = !DILocation(line: 38, column: 38, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 38, column: 37)
!43 = !DILocation(line: 39, column: 21, scope: !32)
!44 = !DILocation(line: 39, column: 13, scope: !32)
!45 = !DILocation(line: 40, column: 13, scope: !32)
!46 = !DILocation(line: 40, column: 31, scope: !32)
!47 = !DILocation(line: 42, column: 20, scope: !32)
!48 = !DILocation(line: 42, column: 31, scope: !32)
!49 = !DILocation(line: 42, column: 18, scope: !32)
!50 = !DILocation(line: 44, column: 5, scope: !33)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !15, line: 46, type: !53)
!52 = distinct !DILexicalBlock(scope: !22, file: !15, line: 45, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 200)
!56 = !DILocation(line: 46, column: 17, scope: !52)
!57 = !DILocation(line: 47, column: 17, scope: !52)
!58 = !DILocation(line: 47, column: 9, scope: !52)
!59 = !DILocation(line: 48, column: 9, scope: !52)
!60 = !DILocation(line: 48, column: 23, scope: !52)
!61 = !DILocation(line: 50, column: 16, scope: !52)
!62 = !DILocation(line: 50, column: 22, scope: !52)
!63 = !DILocation(line: 50, column: 9, scope: !52)
!64 = !DILocation(line: 51, column: 20, scope: !52)
!65 = !DILocation(line: 51, column: 9, scope: !52)
!66 = !DILocation(line: 55, column: 1, scope: !22)
!67 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_05_good", scope: !15, file: !15, line: 122, type: !23, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 124, column: 5, scope: !67)
!69 = !DILocation(line: 125, column: 5, scope: !67)
!70 = !DILocation(line: 126, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 138, type: !72, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!9, !9, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 138, type: !9)
!78 = !DILocation(line: 138, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 138, type: !74)
!80 = !DILocation(line: 138, column: 27, scope: !71)
!81 = !DILocation(line: 141, column: 22, scope: !71)
!82 = !DILocation(line: 141, column: 12, scope: !71)
!83 = !DILocation(line: 141, column: 5, scope: !71)
!84 = !DILocation(line: 143, column: 5, scope: !71)
!85 = !DILocation(line: 144, column: 5, scope: !71)
!86 = !DILocation(line: 145, column: 5, scope: !71)
!87 = !DILocation(line: 148, column: 5, scope: !71)
!88 = !DILocation(line: 149, column: 5, scope: !71)
!89 = !DILocation(line: 150, column: 5, scope: !71)
!90 = !DILocation(line: 152, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 62, type: !23, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !15, line: 64, type: !6)
!93 = !DILocation(line: 64, column: 15, scope: !91)
!94 = !DILocation(line: 65, column: 10, scope: !91)
!95 = !DILocation(line: 66, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !15, line: 66, column: 8)
!97 = !DILocation(line: 66, column: 8, scope: !91)
!98 = !DILocation(line: 69, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !15, line: 67, column: 5)
!100 = !DILocation(line: 70, column: 5, scope: !99)
!101 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !15, line: 74, type: !6)
!102 = distinct !DILexicalBlock(scope: !103, file: !15, line: 73, column: 9)
!103 = distinct !DILexicalBlock(scope: !96, file: !15, line: 72, column: 5)
!104 = !DILocation(line: 74, column: 23, scope: !102)
!105 = !DILocation(line: 74, column: 47, scope: !102)
!106 = !DILocation(line: 74, column: 36, scope: !102)
!107 = !DILocation(line: 75, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !15, line: 75, column: 17)
!109 = !DILocation(line: 75, column: 28, scope: !108)
!110 = !DILocation(line: 75, column: 17, scope: !102)
!111 = !DILocation(line: 75, column: 38, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 75, column: 37)
!113 = !DILocation(line: 76, column: 21, scope: !102)
!114 = !DILocation(line: 76, column: 13, scope: !102)
!115 = !DILocation(line: 77, column: 13, scope: !102)
!116 = !DILocation(line: 77, column: 31, scope: !102)
!117 = !DILocation(line: 79, column: 20, scope: !102)
!118 = !DILocation(line: 79, column: 18, scope: !102)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !15, line: 83, type: !53)
!120 = distinct !DILexicalBlock(scope: !91, file: !15, line: 82, column: 5)
!121 = !DILocation(line: 83, column: 17, scope: !120)
!122 = !DILocation(line: 84, column: 17, scope: !120)
!123 = !DILocation(line: 84, column: 9, scope: !120)
!124 = !DILocation(line: 85, column: 9, scope: !120)
!125 = !DILocation(line: 85, column: 23, scope: !120)
!126 = !DILocation(line: 87, column: 16, scope: !120)
!127 = !DILocation(line: 87, column: 22, scope: !120)
!128 = !DILocation(line: 87, column: 9, scope: !120)
!129 = !DILocation(line: 88, column: 20, scope: !120)
!130 = !DILocation(line: 88, column: 9, scope: !120)
!131 = !DILocation(line: 92, column: 1, scope: !91)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 95, type: !23, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocalVariable(name: "data", scope: !132, file: !15, line: 97, type: !6)
!134 = !DILocation(line: 97, column: 15, scope: !132)
!135 = !DILocation(line: 98, column: 10, scope: !132)
!136 = !DILocation(line: 99, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !15, line: 99, column: 8)
!138 = !DILocation(line: 99, column: 8, scope: !132)
!139 = !DILocalVariable(name: "dataBuffer", scope: !140, file: !15, line: 102, type: !6)
!140 = distinct !DILexicalBlock(scope: !141, file: !15, line: 101, column: 9)
!141 = distinct !DILexicalBlock(scope: !137, file: !15, line: 100, column: 5)
!142 = !DILocation(line: 102, column: 23, scope: !140)
!143 = !DILocation(line: 102, column: 47, scope: !140)
!144 = !DILocation(line: 102, column: 36, scope: !140)
!145 = !DILocation(line: 103, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !15, line: 103, column: 17)
!147 = !DILocation(line: 103, column: 28, scope: !146)
!148 = !DILocation(line: 103, column: 17, scope: !140)
!149 = !DILocation(line: 103, column: 38, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !15, line: 103, column: 37)
!151 = !DILocation(line: 104, column: 21, scope: !140)
!152 = !DILocation(line: 104, column: 13, scope: !140)
!153 = !DILocation(line: 105, column: 13, scope: !140)
!154 = !DILocation(line: 105, column: 31, scope: !140)
!155 = !DILocation(line: 107, column: 20, scope: !140)
!156 = !DILocation(line: 107, column: 18, scope: !140)
!157 = !DILocation(line: 109, column: 5, scope: !141)
!158 = !DILocalVariable(name: "dest", scope: !159, file: !15, line: 111, type: !53)
!159 = distinct !DILexicalBlock(scope: !132, file: !15, line: 110, column: 5)
!160 = !DILocation(line: 111, column: 17, scope: !159)
!161 = !DILocation(line: 112, column: 17, scope: !159)
!162 = !DILocation(line: 112, column: 9, scope: !159)
!163 = !DILocation(line: 113, column: 9, scope: !159)
!164 = !DILocation(line: 113, column: 23, scope: !159)
!165 = !DILocation(line: 115, column: 16, scope: !159)
!166 = !DILocation(line: 115, column: 22, scope: !159)
!167 = !DILocation(line: 115, column: 9, scope: !159)
!168 = !DILocation(line: 116, column: 20, scope: !159)
!169 = !DILocation(line: 116, column: 9, scope: !159)
!170 = !DILocation(line: 120, column: 1, scope: !132)
