; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end4, !dbg !26

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp1 = icmp eq i32* %2, null, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !36

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !40
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  br label %if.end4, !dbg !46

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx6, align 4, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call8 = call i32* @wcscpy(i32* %6, i32* %arraydecay7) #5, !dbg !59
  %7 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %7), !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !91
  %cmp = icmp ne i32 %0, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end4, !dbg !97

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !102
  %1 = bitcast i8* %call to i32*, !dbg !103
  store i32* %1, i32** %dataBuffer, align 8, !dbg !101
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %cmp1 = icmp eq i32* %2, null, !dbg !106
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !107

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !111
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  store i32* %5, i32** %data, align 8, !dbg !115
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !120
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx6, align 4, !dbg !122
  %6 = load i32*, i32** %data, align 8, !dbg !123
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !124
  %call8 = call i32* @wcscpy(i32* %6, i32* %arraydecay7) #5, !dbg !125
  %7 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %7), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !129 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i32* null, i32** %data, align 8, !dbg !132
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !133
  %cmp = icmp eq i32 %0, 5, !dbg !135
  br i1 %cmp, label %if.then, label %if.end4, !dbg !136

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !137, metadata !DIExpression()), !dbg !140
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !141
  %1 = bitcast i8* %call to i32*, !dbg !142
  store i32* %1, i32** %dataBuffer, align 8, !dbg !140
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !143
  %cmp1 = icmp eq i32* %2, null, !dbg !145
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !146

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !149
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !150
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !151
  store i32 0, i32* %arrayidx, align 4, !dbg !152
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !153
  store i32* %5, i32** %data, align 8, !dbg !154
  br label %if.end4, !dbg !155

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !156, metadata !DIExpression()), !dbg !158
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !159
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !160
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx6, align 4, !dbg !162
  %6 = load i32*, i32** %data, align 8, !dbg !163
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !164
  %call8 = call i32* @wcscpy(i32* %6, i32* %arraydecay7) #5, !dbg !165
  %7 = load i32*, i32** %data, align 8, !dbg !166
  call void @printWLine(i32* %7), !dbg !167
  ret void, !dbg !168
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 25, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !17, line: 30, type: !4)
!28 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 9)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 30, column: 23, scope: !28)
!31 = !DILocation(line: 30, column: 47, scope: !28)
!32 = !DILocation(line: 30, column: 36, scope: !28)
!33 = !DILocation(line: 31, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 17)
!35 = !DILocation(line: 31, column: 28, scope: !34)
!36 = !DILocation(line: 31, column: 17, scope: !28)
!37 = !DILocation(line: 31, column: 38, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 31, column: 37)
!39 = !DILocation(line: 32, column: 21, scope: !28)
!40 = !DILocation(line: 32, column: 13, scope: !28)
!41 = !DILocation(line: 33, column: 13, scope: !28)
!42 = !DILocation(line: 33, column: 31, scope: !28)
!43 = !DILocation(line: 35, column: 20, scope: !28)
!44 = !DILocation(line: 35, column: 31, scope: !28)
!45 = !DILocation(line: 35, column: 18, scope: !28)
!46 = !DILocation(line: 37, column: 5, scope: !29)
!47 = !DILocalVariable(name: "source", scope: !48, file: !17, line: 39, type: !49)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 39, column: 17, scope: !48)
!53 = !DILocation(line: 40, column: 17, scope: !48)
!54 = !DILocation(line: 40, column: 9, scope: !48)
!55 = !DILocation(line: 41, column: 9, scope: !48)
!56 = !DILocation(line: 41, column: 23, scope: !48)
!57 = !DILocation(line: 43, column: 16, scope: !48)
!58 = !DILocation(line: 43, column: 22, scope: !48)
!59 = !DILocation(line: 43, column: 9, scope: !48)
!60 = !DILocation(line: 44, column: 20, scope: !48)
!61 = !DILocation(line: 44, column: 9, scope: !48)
!62 = !DILocation(line: 48, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_13_good", scope: !17, file: !17, line: 115, type: !18, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 117, column: 5, scope: !63)
!65 = !DILocation(line: 118, column: 5, scope: !63)
!66 = !DILocation(line: 119, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 131, type: !68, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 131, type: !7)
!74 = !DILocation(line: 131, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 131, type: !70)
!76 = !DILocation(line: 131, column: 27, scope: !67)
!77 = !DILocation(line: 134, column: 22, scope: !67)
!78 = !DILocation(line: 134, column: 12, scope: !67)
!79 = !DILocation(line: 134, column: 5, scope: !67)
!80 = !DILocation(line: 136, column: 5, scope: !67)
!81 = !DILocation(line: 137, column: 5, scope: !67)
!82 = !DILocation(line: 138, column: 5, scope: !67)
!83 = !DILocation(line: 141, column: 5, scope: !67)
!84 = !DILocation(line: 142, column: 5, scope: !67)
!85 = !DILocation(line: 143, column: 5, scope: !67)
!86 = !DILocation(line: 145, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 57, type: !4)
!89 = !DILocation(line: 57, column: 15, scope: !87)
!90 = !DILocation(line: 58, column: 10, scope: !87)
!91 = !DILocation(line: 59, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !17, line: 59, column: 8)
!93 = !DILocation(line: 59, column: 25, scope: !92)
!94 = !DILocation(line: 59, column: 8, scope: !87)
!95 = !DILocation(line: 62, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 60, column: 5)
!97 = !DILocation(line: 63, column: 5, scope: !96)
!98 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !17, line: 67, type: !4)
!99 = distinct !DILexicalBlock(scope: !100, file: !17, line: 66, column: 9)
!100 = distinct !DILexicalBlock(scope: !92, file: !17, line: 65, column: 5)
!101 = !DILocation(line: 67, column: 23, scope: !99)
!102 = !DILocation(line: 67, column: 47, scope: !99)
!103 = !DILocation(line: 67, column: 36, scope: !99)
!104 = !DILocation(line: 68, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !17, line: 68, column: 17)
!106 = !DILocation(line: 68, column: 28, scope: !105)
!107 = !DILocation(line: 68, column: 17, scope: !99)
!108 = !DILocation(line: 68, column: 38, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !17, line: 68, column: 37)
!110 = !DILocation(line: 69, column: 21, scope: !99)
!111 = !DILocation(line: 69, column: 13, scope: !99)
!112 = !DILocation(line: 70, column: 13, scope: !99)
!113 = !DILocation(line: 70, column: 31, scope: !99)
!114 = !DILocation(line: 72, column: 20, scope: !99)
!115 = !DILocation(line: 72, column: 18, scope: !99)
!116 = !DILocalVariable(name: "source", scope: !117, file: !17, line: 76, type: !49)
!117 = distinct !DILexicalBlock(scope: !87, file: !17, line: 75, column: 5)
!118 = !DILocation(line: 76, column: 17, scope: !117)
!119 = !DILocation(line: 77, column: 17, scope: !117)
!120 = !DILocation(line: 77, column: 9, scope: !117)
!121 = !DILocation(line: 78, column: 9, scope: !117)
!122 = !DILocation(line: 78, column: 23, scope: !117)
!123 = !DILocation(line: 80, column: 16, scope: !117)
!124 = !DILocation(line: 80, column: 22, scope: !117)
!125 = !DILocation(line: 80, column: 9, scope: !117)
!126 = !DILocation(line: 81, column: 20, scope: !117)
!127 = !DILocation(line: 81, column: 9, scope: !117)
!128 = !DILocation(line: 85, column: 1, scope: !87)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !17, line: 90, type: !4)
!131 = !DILocation(line: 90, column: 15, scope: !129)
!132 = !DILocation(line: 91, column: 10, scope: !129)
!133 = !DILocation(line: 92, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !17, line: 92, column: 8)
!135 = !DILocation(line: 92, column: 25, scope: !134)
!136 = !DILocation(line: 92, column: 8, scope: !129)
!137 = !DILocalVariable(name: "dataBuffer", scope: !138, file: !17, line: 95, type: !4)
!138 = distinct !DILexicalBlock(scope: !139, file: !17, line: 94, column: 9)
!139 = distinct !DILexicalBlock(scope: !134, file: !17, line: 93, column: 5)
!140 = !DILocation(line: 95, column: 23, scope: !138)
!141 = !DILocation(line: 95, column: 47, scope: !138)
!142 = !DILocation(line: 95, column: 36, scope: !138)
!143 = !DILocation(line: 96, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !17, line: 96, column: 17)
!145 = !DILocation(line: 96, column: 28, scope: !144)
!146 = !DILocation(line: 96, column: 17, scope: !138)
!147 = !DILocation(line: 96, column: 38, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !17, line: 96, column: 37)
!149 = !DILocation(line: 97, column: 21, scope: !138)
!150 = !DILocation(line: 97, column: 13, scope: !138)
!151 = !DILocation(line: 98, column: 13, scope: !138)
!152 = !DILocation(line: 98, column: 31, scope: !138)
!153 = !DILocation(line: 100, column: 20, scope: !138)
!154 = !DILocation(line: 100, column: 18, scope: !138)
!155 = !DILocation(line: 102, column: 5, scope: !139)
!156 = !DILocalVariable(name: "source", scope: !157, file: !17, line: 104, type: !49)
!157 = distinct !DILexicalBlock(scope: !129, file: !17, line: 103, column: 5)
!158 = !DILocation(line: 104, column: 17, scope: !157)
!159 = !DILocation(line: 105, column: 17, scope: !157)
!160 = !DILocation(line: 105, column: 9, scope: !157)
!161 = !DILocation(line: 106, column: 9, scope: !157)
!162 = !DILocation(line: 106, column: 23, scope: !157)
!163 = !DILocation(line: 108, column: 16, scope: !157)
!164 = !DILocation(line: 108, column: 22, scope: !157)
!165 = !DILocation(line: 108, column: 9, scope: !157)
!166 = !DILocation(line: 109, column: 20, scope: !157)
!167 = !DILocation(line: 109, column: 9, scope: !157)
!168 = !DILocation(line: 113, column: 1, scope: !129)
