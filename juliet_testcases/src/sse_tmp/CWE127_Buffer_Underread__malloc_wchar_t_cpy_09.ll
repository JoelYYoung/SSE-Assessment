; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_09.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_09_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %2, null, !dbg !34
  br i1 %cmp, label %if.then1, label %if.end, !dbg !35

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !53
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !54
  store i32 0, i32* %arrayidx5, align 4, !dbg !55
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %6) #5, !dbg !58
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* %arraydecay8), !dbg !60
  ret void, !dbg !61
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_09_good() #0 !dbg !62 {
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
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_09_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_09_bad(), !dbg !83
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
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32* null, i32** %data, align 8, !dbg !89
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !90
  %tobool = icmp ne i32 %0, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end3, !dbg !95

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !100
  %1 = bitcast i8* %call to i32*, !dbg !101
  store i32* %1, i32** %dataBuffer, align 8, !dbg !99
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %cmp = icmp eq i32* %2, null, !dbg !104
  br i1 %cmp, label %if.then1, label %if.end, !dbg !105

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !109
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  store i32* %5, i32** %data, align 8, !dbg !113
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !117
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !118
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !119
  store i32 0, i32* %arrayidx5, align 4, !dbg !120
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !122
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %6) #5, !dbg !123
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !124
  call void @printWLine(i32* %arraydecay8), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  store i32* null, i32** %data, align 8, !dbg !130
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !131
  %tobool = icmp ne i32 %0, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.end3, !dbg !133

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !134, metadata !DIExpression()), !dbg !137
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !138
  %1 = bitcast i8* %call to i32*, !dbg !139
  store i32* %1, i32** %dataBuffer, align 8, !dbg !137
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !140
  %cmp = icmp eq i32* %2, null, !dbg !142
  br i1 %cmp, label %if.then1, label %if.end, !dbg !143

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !147
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  store i32* %5, i32** %data, align 8, !dbg !151
  br label %if.end3, !dbg !152

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !153, metadata !DIExpression()), !dbg !155
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !156
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !157
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !158
  store i32 0, i32* %arrayidx5, align 4, !dbg !159
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !160
  %6 = load i32*, i32** %data, align 8, !dbg !161
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %6) #5, !dbg !162
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !163
  call void @printWLine(i32* %arraydecay8), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_09_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !17, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !28, file: !17, line: 29, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 23, scope: !27)
!30 = !DILocation(line: 30, column: 47, scope: !27)
!31 = !DILocation(line: 30, column: 36, scope: !27)
!32 = !DILocation(line: 31, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 17)
!34 = !DILocation(line: 31, column: 28, scope: !33)
!35 = !DILocation(line: 31, column: 17, scope: !27)
!36 = !DILocation(line: 31, column: 38, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 31, column: 37)
!38 = !DILocation(line: 32, column: 21, scope: !27)
!39 = !DILocation(line: 32, column: 13, scope: !27)
!40 = !DILocation(line: 33, column: 13, scope: !27)
!41 = !DILocation(line: 33, column: 31, scope: !27)
!42 = !DILocation(line: 35, column: 20, scope: !27)
!43 = !DILocation(line: 35, column: 31, scope: !27)
!44 = !DILocation(line: 35, column: 18, scope: !27)
!45 = !DILocation(line: 37, column: 5, scope: !28)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !17, line: 39, type: !48)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 200)
!51 = !DILocation(line: 39, column: 17, scope: !47)
!52 = !DILocation(line: 40, column: 17, scope: !47)
!53 = !DILocation(line: 40, column: 9, scope: !47)
!54 = !DILocation(line: 41, column: 9, scope: !47)
!55 = !DILocation(line: 41, column: 23, scope: !47)
!56 = !DILocation(line: 43, column: 16, scope: !47)
!57 = !DILocation(line: 43, column: 22, scope: !47)
!58 = !DILocation(line: 43, column: 9, scope: !47)
!59 = !DILocation(line: 44, column: 20, scope: !47)
!60 = !DILocation(line: 44, column: 9, scope: !47)
!61 = !DILocation(line: 48, column: 1, scope: !16)
!62 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_09_good", scope: !17, file: !17, line: 115, type: !18, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 117, column: 5, scope: !62)
!64 = !DILocation(line: 118, column: 5, scope: !62)
!65 = !DILocation(line: 119, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 131, type: !67, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !17, line: 131, type: !7)
!73 = !DILocation(line: 131, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !17, line: 131, type: !69)
!75 = !DILocation(line: 131, column: 27, scope: !66)
!76 = !DILocation(line: 134, column: 22, scope: !66)
!77 = !DILocation(line: 134, column: 12, scope: !66)
!78 = !DILocation(line: 134, column: 5, scope: !66)
!79 = !DILocation(line: 136, column: 5, scope: !66)
!80 = !DILocation(line: 137, column: 5, scope: !66)
!81 = !DILocation(line: 138, column: 5, scope: !66)
!82 = !DILocation(line: 141, column: 5, scope: !66)
!83 = !DILocation(line: 142, column: 5, scope: !66)
!84 = !DILocation(line: 143, column: 5, scope: !66)
!85 = !DILocation(line: 145, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !17, line: 57, type: !4)
!88 = !DILocation(line: 57, column: 15, scope: !86)
!89 = !DILocation(line: 58, column: 10, scope: !86)
!90 = !DILocation(line: 59, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !17, line: 59, column: 8)
!92 = !DILocation(line: 59, column: 8, scope: !86)
!93 = !DILocation(line: 62, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !17, line: 60, column: 5)
!95 = !DILocation(line: 63, column: 5, scope: !94)
!96 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !17, line: 67, type: !4)
!97 = distinct !DILexicalBlock(scope: !98, file: !17, line: 66, column: 9)
!98 = distinct !DILexicalBlock(scope: !91, file: !17, line: 65, column: 5)
!99 = !DILocation(line: 67, column: 23, scope: !97)
!100 = !DILocation(line: 67, column: 47, scope: !97)
!101 = !DILocation(line: 67, column: 36, scope: !97)
!102 = !DILocation(line: 68, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !17, line: 68, column: 17)
!104 = !DILocation(line: 68, column: 28, scope: !103)
!105 = !DILocation(line: 68, column: 17, scope: !97)
!106 = !DILocation(line: 68, column: 38, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !17, line: 68, column: 37)
!108 = !DILocation(line: 69, column: 21, scope: !97)
!109 = !DILocation(line: 69, column: 13, scope: !97)
!110 = !DILocation(line: 70, column: 13, scope: !97)
!111 = !DILocation(line: 70, column: 31, scope: !97)
!112 = !DILocation(line: 72, column: 20, scope: !97)
!113 = !DILocation(line: 72, column: 18, scope: !97)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !17, line: 76, type: !48)
!115 = distinct !DILexicalBlock(scope: !86, file: !17, line: 75, column: 5)
!116 = !DILocation(line: 76, column: 17, scope: !115)
!117 = !DILocation(line: 77, column: 17, scope: !115)
!118 = !DILocation(line: 77, column: 9, scope: !115)
!119 = !DILocation(line: 78, column: 9, scope: !115)
!120 = !DILocation(line: 78, column: 23, scope: !115)
!121 = !DILocation(line: 80, column: 16, scope: !115)
!122 = !DILocation(line: 80, column: 22, scope: !115)
!123 = !DILocation(line: 80, column: 9, scope: !115)
!124 = !DILocation(line: 81, column: 20, scope: !115)
!125 = !DILocation(line: 81, column: 9, scope: !115)
!126 = !DILocation(line: 85, column: 1, scope: !86)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocalVariable(name: "data", scope: !127, file: !17, line: 90, type: !4)
!129 = !DILocation(line: 90, column: 15, scope: !127)
!130 = !DILocation(line: 91, column: 10, scope: !127)
!131 = !DILocation(line: 92, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !17, line: 92, column: 8)
!133 = !DILocation(line: 92, column: 8, scope: !127)
!134 = !DILocalVariable(name: "dataBuffer", scope: !135, file: !17, line: 95, type: !4)
!135 = distinct !DILexicalBlock(scope: !136, file: !17, line: 94, column: 9)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 93, column: 5)
!137 = !DILocation(line: 95, column: 23, scope: !135)
!138 = !DILocation(line: 95, column: 47, scope: !135)
!139 = !DILocation(line: 95, column: 36, scope: !135)
!140 = !DILocation(line: 96, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !17, line: 96, column: 17)
!142 = !DILocation(line: 96, column: 28, scope: !141)
!143 = !DILocation(line: 96, column: 17, scope: !135)
!144 = !DILocation(line: 96, column: 38, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !17, line: 96, column: 37)
!146 = !DILocation(line: 97, column: 21, scope: !135)
!147 = !DILocation(line: 97, column: 13, scope: !135)
!148 = !DILocation(line: 98, column: 13, scope: !135)
!149 = !DILocation(line: 98, column: 31, scope: !135)
!150 = !DILocation(line: 100, column: 20, scope: !135)
!151 = !DILocation(line: 100, column: 18, scope: !135)
!152 = !DILocation(line: 102, column: 5, scope: !136)
!153 = !DILocalVariable(name: "dest", scope: !154, file: !17, line: 104, type: !48)
!154 = distinct !DILexicalBlock(scope: !127, file: !17, line: 103, column: 5)
!155 = !DILocation(line: 104, column: 17, scope: !154)
!156 = !DILocation(line: 105, column: 17, scope: !154)
!157 = !DILocation(line: 105, column: 9, scope: !154)
!158 = !DILocation(line: 106, column: 9, scope: !154)
!159 = !DILocation(line: 106, column: 23, scope: !154)
!160 = !DILocation(line: 108, column: 16, scope: !154)
!161 = !DILocation(line: 108, column: 22, scope: !154)
!162 = !DILocation(line: 108, column: 9, scope: !154)
!163 = !DILocation(line: 109, column: 20, scope: !154)
!164 = !DILocation(line: 109, column: 9, scope: !154)
!165 = !DILocation(line: 113, column: 1, scope: !127)
