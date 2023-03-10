; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end4, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !30
  %0 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %0, i32** %dataBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !39
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end4, !dbg !45

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !53
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx6, align 4, !dbg !55
  %5 = load i32*, i32** %data, align 8, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %call8 = call i32* @wcscpy(i32* %5, i32* %arraydecay7) #5, !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* %6), !dbg !60
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08_good() #0 !dbg !62 {
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
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !86 {
entry:
  ret i32 1, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %call = call i32 @staticReturnsFalse(), !dbg !94
  %tobool = icmp ne i32 %call, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end4, !dbg !99

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !103
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !104
  %0 = bitcast i8* %call1 to i32*, !dbg !105
  store i32* %0, i32** %dataBuffer, align 8, !dbg !103
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %cmp = icmp eq i32* %1, null, !dbg !108
  br i1 %cmp, label %if.then2, label %if.end, !dbg !109

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !113
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  store i32* %4, i32** %data, align 8, !dbg !117
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !122
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx6, align 4, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %call8 = call i32* @wcscpy(i32* %5, i32* %arraydecay7) #5, !dbg !127
  %6 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* %6), !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !131 {
entry:
  ret i32 0, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !134, metadata !DIExpression()), !dbg !135
  store i32* null, i32** %data, align 8, !dbg !136
  %call = call i32 @staticReturnsTrue(), !dbg !137
  %tobool = icmp ne i32 %call, 0, !dbg !137
  br i1 %tobool, label %if.then, label %if.end4, !dbg !139

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !140, metadata !DIExpression()), !dbg !143
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !144
  %0 = bitcast i8* %call1 to i32*, !dbg !145
  store i32* %0, i32** %dataBuffer, align 8, !dbg !143
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  %cmp = icmp eq i32* %1, null, !dbg !148
  br i1 %cmp, label %if.then2, label %if.end, !dbg !149

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !150
  unreachable, !dbg !150

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !152
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !153
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  store i32* %4, i32** %data, align 8, !dbg !157
  br label %if.end4, !dbg !158

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !159, metadata !DIExpression()), !dbg !161
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !162
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !163
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !164
  store i32 0, i32* %arrayidx6, align 4, !dbg !165
  %5 = load i32*, i32** %data, align 8, !dbg !166
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !167
  %call8 = call i32* @wcscpy(i32* %5, i32* %arraydecay7) #5, !dbg !168
  %6 = load i32*, i32** %data, align 8, !dbg !169
  call void @printWLine(i32* %6), !dbg !170
  ret void, !dbg !171
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 10, scope: !16)
!23 = !DILocation(line: 41, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!25 = !DILocation(line: 41, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !17, line: 44, type: !4)
!27 = distinct !DILexicalBlock(scope: !28, file: !17, line: 43, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 5)
!29 = !DILocation(line: 44, column: 23, scope: !27)
!30 = !DILocation(line: 44, column: 47, scope: !27)
!31 = !DILocation(line: 44, column: 36, scope: !27)
!32 = !DILocation(line: 45, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !17, line: 45, column: 17)
!34 = !DILocation(line: 45, column: 28, scope: !33)
!35 = !DILocation(line: 45, column: 17, scope: !27)
!36 = !DILocation(line: 45, column: 38, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 45, column: 37)
!38 = !DILocation(line: 46, column: 21, scope: !27)
!39 = !DILocation(line: 46, column: 13, scope: !27)
!40 = !DILocation(line: 47, column: 13, scope: !27)
!41 = !DILocation(line: 47, column: 31, scope: !27)
!42 = !DILocation(line: 49, column: 20, scope: !27)
!43 = !DILocation(line: 49, column: 31, scope: !27)
!44 = !DILocation(line: 49, column: 18, scope: !27)
!45 = !DILocation(line: 51, column: 5, scope: !28)
!46 = !DILocalVariable(name: "source", scope: !47, file: !17, line: 53, type: !48)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 52, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 53, column: 17, scope: !47)
!52 = !DILocation(line: 54, column: 17, scope: !47)
!53 = !DILocation(line: 54, column: 9, scope: !47)
!54 = !DILocation(line: 55, column: 9, scope: !47)
!55 = !DILocation(line: 55, column: 23, scope: !47)
!56 = !DILocation(line: 57, column: 16, scope: !47)
!57 = !DILocation(line: 57, column: 22, scope: !47)
!58 = !DILocation(line: 57, column: 9, scope: !47)
!59 = !DILocation(line: 58, column: 20, scope: !47)
!60 = !DILocation(line: 58, column: 9, scope: !47)
!61 = !DILocation(line: 62, column: 1, scope: !16)
!62 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_08_good", scope: !17, file: !17, line: 129, type: !18, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 131, column: 5, scope: !62)
!64 = !DILocation(line: 132, column: 5, scope: !62)
!65 = !DILocation(line: 133, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 145, type: !67, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !17, line: 145, type: !7)
!73 = !DILocation(line: 145, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !17, line: 145, type: !69)
!75 = !DILocation(line: 145, column: 27, scope: !66)
!76 = !DILocation(line: 148, column: 22, scope: !66)
!77 = !DILocation(line: 148, column: 12, scope: !66)
!78 = !DILocation(line: 148, column: 5, scope: !66)
!79 = !DILocation(line: 150, column: 5, scope: !66)
!80 = !DILocation(line: 151, column: 5, scope: !66)
!81 = !DILocation(line: 152, column: 5, scope: !66)
!82 = !DILocation(line: 155, column: 5, scope: !66)
!83 = !DILocation(line: 156, column: 5, scope: !66)
!84 = !DILocation(line: 157, column: 5, scope: !66)
!85 = !DILocation(line: 159, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !87, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!7}
!89 = !DILocation(line: 27, column: 5, scope: !86)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 69, type: !18, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !17, line: 71, type: !4)
!92 = !DILocation(line: 71, column: 15, scope: !90)
!93 = !DILocation(line: 72, column: 10, scope: !90)
!94 = !DILocation(line: 73, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !17, line: 73, column: 8)
!96 = !DILocation(line: 73, column: 8, scope: !90)
!97 = !DILocation(line: 76, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !17, line: 74, column: 5)
!99 = !DILocation(line: 77, column: 5, scope: !98)
!100 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !17, line: 81, type: !4)
!101 = distinct !DILexicalBlock(scope: !102, file: !17, line: 80, column: 9)
!102 = distinct !DILexicalBlock(scope: !95, file: !17, line: 79, column: 5)
!103 = !DILocation(line: 81, column: 23, scope: !101)
!104 = !DILocation(line: 81, column: 47, scope: !101)
!105 = !DILocation(line: 81, column: 36, scope: !101)
!106 = !DILocation(line: 82, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !17, line: 82, column: 17)
!108 = !DILocation(line: 82, column: 28, scope: !107)
!109 = !DILocation(line: 82, column: 17, scope: !101)
!110 = !DILocation(line: 82, column: 38, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !17, line: 82, column: 37)
!112 = !DILocation(line: 83, column: 21, scope: !101)
!113 = !DILocation(line: 83, column: 13, scope: !101)
!114 = !DILocation(line: 84, column: 13, scope: !101)
!115 = !DILocation(line: 84, column: 31, scope: !101)
!116 = !DILocation(line: 86, column: 20, scope: !101)
!117 = !DILocation(line: 86, column: 18, scope: !101)
!118 = !DILocalVariable(name: "source", scope: !119, file: !17, line: 90, type: !48)
!119 = distinct !DILexicalBlock(scope: !90, file: !17, line: 89, column: 5)
!120 = !DILocation(line: 90, column: 17, scope: !119)
!121 = !DILocation(line: 91, column: 17, scope: !119)
!122 = !DILocation(line: 91, column: 9, scope: !119)
!123 = !DILocation(line: 92, column: 9, scope: !119)
!124 = !DILocation(line: 92, column: 23, scope: !119)
!125 = !DILocation(line: 94, column: 16, scope: !119)
!126 = !DILocation(line: 94, column: 22, scope: !119)
!127 = !DILocation(line: 94, column: 9, scope: !119)
!128 = !DILocation(line: 95, column: 20, scope: !119)
!129 = !DILocation(line: 95, column: 9, scope: !119)
!130 = !DILocation(line: 99, column: 1, scope: !90)
!131 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !87, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocation(line: 32, column: 5, scope: !131)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 102, type: !18, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !17, line: 104, type: !4)
!135 = !DILocation(line: 104, column: 15, scope: !133)
!136 = !DILocation(line: 105, column: 10, scope: !133)
!137 = !DILocation(line: 106, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !17, line: 106, column: 8)
!139 = !DILocation(line: 106, column: 8, scope: !133)
!140 = !DILocalVariable(name: "dataBuffer", scope: !141, file: !17, line: 109, type: !4)
!141 = distinct !DILexicalBlock(scope: !142, file: !17, line: 108, column: 9)
!142 = distinct !DILexicalBlock(scope: !138, file: !17, line: 107, column: 5)
!143 = !DILocation(line: 109, column: 23, scope: !141)
!144 = !DILocation(line: 109, column: 47, scope: !141)
!145 = !DILocation(line: 109, column: 36, scope: !141)
!146 = !DILocation(line: 110, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !17, line: 110, column: 17)
!148 = !DILocation(line: 110, column: 28, scope: !147)
!149 = !DILocation(line: 110, column: 17, scope: !141)
!150 = !DILocation(line: 110, column: 38, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !17, line: 110, column: 37)
!152 = !DILocation(line: 111, column: 21, scope: !141)
!153 = !DILocation(line: 111, column: 13, scope: !141)
!154 = !DILocation(line: 112, column: 13, scope: !141)
!155 = !DILocation(line: 112, column: 31, scope: !141)
!156 = !DILocation(line: 114, column: 20, scope: !141)
!157 = !DILocation(line: 114, column: 18, scope: !141)
!158 = !DILocation(line: 116, column: 5, scope: !142)
!159 = !DILocalVariable(name: "source", scope: !160, file: !17, line: 118, type: !48)
!160 = distinct !DILexicalBlock(scope: !133, file: !17, line: 117, column: 5)
!161 = !DILocation(line: 118, column: 17, scope: !160)
!162 = !DILocation(line: 119, column: 17, scope: !160)
!163 = !DILocation(line: 119, column: 9, scope: !160)
!164 = !DILocation(line: 120, column: 9, scope: !160)
!165 = !DILocation(line: 120, column: 23, scope: !160)
!166 = !DILocation(line: 122, column: 16, scope: !160)
!167 = !DILocation(line: 122, column: 22, scope: !160)
!168 = !DILocation(line: 122, column: 9, scope: !160)
!169 = !DILocation(line: 123, column: 20, scope: !160)
!170 = !DILocation(line: 123, column: 9, scope: !160)
!171 = !DILocation(line: 127, column: 1, scope: !133)
