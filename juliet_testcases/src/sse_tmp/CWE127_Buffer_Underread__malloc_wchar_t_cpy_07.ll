; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end4, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !34
  %1 = bitcast i8* %call to i32*, !dbg !35
  store i32* %1, i32** %dataBuffer, align 8, !dbg !33
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !39

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !43
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !47
  store i32* %add.ptr, i32** %data, align 8, !dbg !48
  br label %if.end4, !dbg !49

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !57
  %arrayidx6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !58
  store i32 0, i32* %arrayidx6, align 4, !dbg !59
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !60
  %6 = load i32*, i32** %data, align 8, !dbg !61
  %call8 = call i32* @wcscpy(i32* %arraydecay7, i32* %6) #5, !dbg !62
  %arraydecay9 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay9), !dbg !64
  ret void, !dbg !65
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_07_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_07_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_07_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %0 = load i32, i32* @staticFive, align 4, !dbg !94
  %cmp = icmp ne i32 %0, 5, !dbg !96
  br i1 %cmp, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end4, !dbg !100

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !104
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !105
  %1 = bitcast i8* %call to i32*, !dbg !106
  store i32* %1, i32** %dataBuffer, align 8, !dbg !104
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %cmp1 = icmp eq i32* %2, null, !dbg !109
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !110

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !114
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  store i32* %5, i32** %data, align 8, !dbg !118
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !123
  %arrayidx6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !124
  store i32 0, i32* %arrayidx6, align 4, !dbg !125
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !126
  %6 = load i32*, i32** %data, align 8, !dbg !127
  %call8 = call i32* @wcscpy(i32* %arraydecay7, i32* %6) #5, !dbg !128
  %arraydecay9 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* %arraydecay9), !dbg !130
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !136
  %cmp = icmp eq i32 %0, 5, !dbg !138
  br i1 %cmp, label %if.then, label %if.end4, !dbg !139

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !140, metadata !DIExpression()), !dbg !143
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !144
  %1 = bitcast i8* %call to i32*, !dbg !145
  store i32* %1, i32** %dataBuffer, align 8, !dbg !143
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  %cmp1 = icmp eq i32* %2, null, !dbg !148
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !149

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !150
  unreachable, !dbg !150

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !152
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !153
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  store i32* %5, i32** %data, align 8, !dbg !157
  br label %if.end4, !dbg !158

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !159, metadata !DIExpression()), !dbg !161
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !162
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #5, !dbg !163
  %arrayidx6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !164
  store i32 0, i32* %arrayidx6, align 4, !dbg !165
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !166
  %6 = load i32*, i32** %data, align 8, !dbg !167
  %call8 = call i32* @wcscpy(i32* %arraydecay7, i32* %6) #5, !dbg !168
  %arraydecay9 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !169
  call void @printWLine(i32* %arraydecay9), !dbg !170
  ret void, !dbg !171
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !13, line: 36, type: !6)
!31 = distinct !DILexicalBlock(scope: !32, file: !13, line: 35, column: 9)
!32 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!33 = !DILocation(line: 36, column: 23, scope: !31)
!34 = !DILocation(line: 36, column: 47, scope: !31)
!35 = !DILocation(line: 36, column: 36, scope: !31)
!36 = !DILocation(line: 37, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 17)
!38 = !DILocation(line: 37, column: 28, scope: !37)
!39 = !DILocation(line: 37, column: 17, scope: !31)
!40 = !DILocation(line: 37, column: 38, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !13, line: 37, column: 37)
!42 = !DILocation(line: 38, column: 21, scope: !31)
!43 = !DILocation(line: 38, column: 13, scope: !31)
!44 = !DILocation(line: 39, column: 13, scope: !31)
!45 = !DILocation(line: 39, column: 31, scope: !31)
!46 = !DILocation(line: 41, column: 20, scope: !31)
!47 = !DILocation(line: 41, column: 31, scope: !31)
!48 = !DILocation(line: 41, column: 18, scope: !31)
!49 = !DILocation(line: 43, column: 5, scope: !32)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !13, line: 45, type: !52)
!51 = distinct !DILexicalBlock(scope: !20, file: !13, line: 44, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 200)
!55 = !DILocation(line: 45, column: 17, scope: !51)
!56 = !DILocation(line: 46, column: 17, scope: !51)
!57 = !DILocation(line: 46, column: 9, scope: !51)
!58 = !DILocation(line: 47, column: 9, scope: !51)
!59 = !DILocation(line: 47, column: 23, scope: !51)
!60 = !DILocation(line: 49, column: 16, scope: !51)
!61 = !DILocation(line: 49, column: 22, scope: !51)
!62 = !DILocation(line: 49, column: 9, scope: !51)
!63 = !DILocation(line: 50, column: 20, scope: !51)
!64 = !DILocation(line: 50, column: 9, scope: !51)
!65 = !DILocation(line: 54, column: 1, scope: !20)
!66 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_07_good", scope: !13, file: !13, line: 121, type: !21, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 123, column: 5, scope: !66)
!68 = !DILocation(line: 124, column: 5, scope: !66)
!69 = !DILocation(line: 125, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 137, type: !71, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!9, !9, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !13, line: 137, type: !9)
!77 = !DILocation(line: 137, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !13, line: 137, type: !73)
!79 = !DILocation(line: 137, column: 27, scope: !70)
!80 = !DILocation(line: 140, column: 22, scope: !70)
!81 = !DILocation(line: 140, column: 12, scope: !70)
!82 = !DILocation(line: 140, column: 5, scope: !70)
!83 = !DILocation(line: 142, column: 5, scope: !70)
!84 = !DILocation(line: 143, column: 5, scope: !70)
!85 = !DILocation(line: 144, column: 5, scope: !70)
!86 = !DILocation(line: 147, column: 5, scope: !70)
!87 = !DILocation(line: 148, column: 5, scope: !70)
!88 = !DILocation(line: 149, column: 5, scope: !70)
!89 = !DILocation(line: 151, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !13, line: 63, type: !6)
!92 = !DILocation(line: 63, column: 15, scope: !90)
!93 = !DILocation(line: 64, column: 10, scope: !90)
!94 = !DILocation(line: 65, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !13, line: 65, column: 8)
!96 = !DILocation(line: 65, column: 18, scope: !95)
!97 = !DILocation(line: 65, column: 8, scope: !90)
!98 = !DILocation(line: 68, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !13, line: 66, column: 5)
!100 = !DILocation(line: 69, column: 5, scope: !99)
!101 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !13, line: 73, type: !6)
!102 = distinct !DILexicalBlock(scope: !103, file: !13, line: 72, column: 9)
!103 = distinct !DILexicalBlock(scope: !95, file: !13, line: 71, column: 5)
!104 = !DILocation(line: 73, column: 23, scope: !102)
!105 = !DILocation(line: 73, column: 47, scope: !102)
!106 = !DILocation(line: 73, column: 36, scope: !102)
!107 = !DILocation(line: 74, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !13, line: 74, column: 17)
!109 = !DILocation(line: 74, column: 28, scope: !108)
!110 = !DILocation(line: 74, column: 17, scope: !102)
!111 = !DILocation(line: 74, column: 38, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !13, line: 74, column: 37)
!113 = !DILocation(line: 75, column: 21, scope: !102)
!114 = !DILocation(line: 75, column: 13, scope: !102)
!115 = !DILocation(line: 76, column: 13, scope: !102)
!116 = !DILocation(line: 76, column: 31, scope: !102)
!117 = !DILocation(line: 78, column: 20, scope: !102)
!118 = !DILocation(line: 78, column: 18, scope: !102)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !13, line: 82, type: !52)
!120 = distinct !DILexicalBlock(scope: !90, file: !13, line: 81, column: 5)
!121 = !DILocation(line: 82, column: 17, scope: !120)
!122 = !DILocation(line: 83, column: 17, scope: !120)
!123 = !DILocation(line: 83, column: 9, scope: !120)
!124 = !DILocation(line: 84, column: 9, scope: !120)
!125 = !DILocation(line: 84, column: 23, scope: !120)
!126 = !DILocation(line: 86, column: 16, scope: !120)
!127 = !DILocation(line: 86, column: 22, scope: !120)
!128 = !DILocation(line: 86, column: 9, scope: !120)
!129 = !DILocation(line: 87, column: 20, scope: !120)
!130 = !DILocation(line: 87, column: 9, scope: !120)
!131 = !DILocation(line: 91, column: 1, scope: !90)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 94, type: !21, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocalVariable(name: "data", scope: !132, file: !13, line: 96, type: !6)
!134 = !DILocation(line: 96, column: 15, scope: !132)
!135 = !DILocation(line: 97, column: 10, scope: !132)
!136 = !DILocation(line: 98, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !13, line: 98, column: 8)
!138 = !DILocation(line: 98, column: 18, scope: !137)
!139 = !DILocation(line: 98, column: 8, scope: !132)
!140 = !DILocalVariable(name: "dataBuffer", scope: !141, file: !13, line: 101, type: !6)
!141 = distinct !DILexicalBlock(scope: !142, file: !13, line: 100, column: 9)
!142 = distinct !DILexicalBlock(scope: !137, file: !13, line: 99, column: 5)
!143 = !DILocation(line: 101, column: 23, scope: !141)
!144 = !DILocation(line: 101, column: 47, scope: !141)
!145 = !DILocation(line: 101, column: 36, scope: !141)
!146 = !DILocation(line: 102, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !13, line: 102, column: 17)
!148 = !DILocation(line: 102, column: 28, scope: !147)
!149 = !DILocation(line: 102, column: 17, scope: !141)
!150 = !DILocation(line: 102, column: 38, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !13, line: 102, column: 37)
!152 = !DILocation(line: 103, column: 21, scope: !141)
!153 = !DILocation(line: 103, column: 13, scope: !141)
!154 = !DILocation(line: 104, column: 13, scope: !141)
!155 = !DILocation(line: 104, column: 31, scope: !141)
!156 = !DILocation(line: 106, column: 20, scope: !141)
!157 = !DILocation(line: 106, column: 18, scope: !141)
!158 = !DILocation(line: 108, column: 5, scope: !142)
!159 = !DILocalVariable(name: "dest", scope: !160, file: !13, line: 110, type: !52)
!160 = distinct !DILexicalBlock(scope: !132, file: !13, line: 109, column: 5)
!161 = !DILocation(line: 110, column: 17, scope: !160)
!162 = !DILocation(line: 111, column: 17, scope: !160)
!163 = !DILocation(line: 111, column: 9, scope: !160)
!164 = !DILocation(line: 112, column: 9, scope: !160)
!165 = !DILocation(line: 112, column: 23, scope: !160)
!166 = !DILocation(line: 114, column: 16, scope: !160)
!167 = !DILocation(line: 114, column: 22, scope: !160)
!168 = !DILocation(line: 114, column: 9, scope: !160)
!169 = !DILocation(line: 115, column: 20, scope: !160)
!170 = !DILocation(line: 115, column: 9, scope: !160)
!171 = !DILocation(line: 119, column: 1, scope: !132)
