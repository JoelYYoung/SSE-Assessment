; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %while.body, !dbg !23

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !37
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  br label %while.end, !dbg !43

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx3, align 4, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !61
  %cmp4 = icmp ult i64 %5, 100, !dbg !63
  br i1 %cmp4, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !67
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !67
  %8 = load i32*, i32** %data, align 8, !dbg !68
  %9 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !68
  store i32 %7, i32* %arrayidx6, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %10, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !77
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !77
  store i32 0, i32* %arrayidx7, align 4, !dbg !78
  %12 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %12), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %data, align 8, !dbg !108
  br label %while.body, !dbg !109

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !114
  %0 = bitcast i8* %call to i32*, !dbg !115
  store i32* %0, i32** %dataBuffer, align 8, !dbg !113
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !123
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  store i32* %4, i32** %data, align 8, !dbg !127
  br label %while.end, !dbg !128

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx3, align 4, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !141
  %cmp4 = icmp ult i64 %5, 100, !dbg !143
  br i1 %cmp4, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !147
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !147
  %8 = load i32*, i32** %data, align 8, !dbg !148
  %9 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !148
  store i32 %7, i32* %arrayidx6, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %10, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !156
  store i32 0, i32* %arrayidx7, align 4, !dbg !157
  %12 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %12), !dbg !159
  ret void, !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !17, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !17, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 23, scope: !25)
!28 = !DILocation(line: 30, column: 47, scope: !25)
!29 = !DILocation(line: 30, column: 36, scope: !25)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !25, file: !17, line: 31, column: 17)
!32 = !DILocation(line: 31, column: 28, scope: !31)
!33 = !DILocation(line: 31, column: 17, scope: !25)
!34 = !DILocation(line: 31, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 37)
!36 = !DILocation(line: 32, column: 21, scope: !25)
!37 = !DILocation(line: 32, column: 13, scope: !25)
!38 = !DILocation(line: 33, column: 13, scope: !25)
!39 = !DILocation(line: 33, column: 31, scope: !25)
!40 = !DILocation(line: 35, column: 20, scope: !25)
!41 = !DILocation(line: 35, column: 31, scope: !25)
!42 = !DILocation(line: 35, column: 18, scope: !25)
!43 = !DILocation(line: 37, column: 9, scope: !26)
!44 = !DILocalVariable(name: "i", scope: !45, file: !17, line: 40, type: !46)
!45 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 40, column: 16, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !45, file: !17, line: 41, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 41, column: 17, scope: !45)
!54 = !DILocation(line: 42, column: 17, scope: !45)
!55 = !DILocation(line: 42, column: 9, scope: !45)
!56 = !DILocation(line: 43, column: 9, scope: !45)
!57 = !DILocation(line: 43, column: 23, scope: !45)
!58 = !DILocation(line: 45, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !45, file: !17, line: 45, column: 9)
!60 = !DILocation(line: 45, column: 14, scope: !59)
!61 = !DILocation(line: 45, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !17, line: 45, column: 9)
!63 = !DILocation(line: 45, column: 23, scope: !62)
!64 = !DILocation(line: 45, column: 9, scope: !59)
!65 = !DILocation(line: 47, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !17, line: 46, column: 9)
!67 = !DILocation(line: 47, column: 23, scope: !66)
!68 = !DILocation(line: 47, column: 13, scope: !66)
!69 = !DILocation(line: 47, column: 18, scope: !66)
!70 = !DILocation(line: 47, column: 21, scope: !66)
!71 = !DILocation(line: 48, column: 9, scope: !66)
!72 = !DILocation(line: 45, column: 31, scope: !62)
!73 = !DILocation(line: 45, column: 9, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 48, column: 9, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 50, column: 9, scope: !45)
!78 = !DILocation(line: 50, column: 21, scope: !45)
!79 = !DILocation(line: 51, column: 20, scope: !45)
!80 = !DILocation(line: 51, column: 9, scope: !45)
!81 = !DILocation(line: 55, column: 1, scope: !16)
!82 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_16_good", scope: !17, file: !17, line: 96, type: !18, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 98, column: 5, scope: !82)
!84 = !DILocation(line: 99, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 111, type: !86, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!7, !7, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !17, line: 111, type: !7)
!92 = !DILocation(line: 111, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !17, line: 111, type: !88)
!94 = !DILocation(line: 111, column: 27, scope: !85)
!95 = !DILocation(line: 114, column: 22, scope: !85)
!96 = !DILocation(line: 114, column: 12, scope: !85)
!97 = !DILocation(line: 114, column: 5, scope: !85)
!98 = !DILocation(line: 116, column: 5, scope: !85)
!99 = !DILocation(line: 117, column: 5, scope: !85)
!100 = !DILocation(line: 118, column: 5, scope: !85)
!101 = !DILocation(line: 121, column: 5, scope: !85)
!102 = !DILocation(line: 122, column: 5, scope: !85)
!103 = !DILocation(line: 123, column: 5, scope: !85)
!104 = !DILocation(line: 125, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 64, type: !4)
!107 = !DILocation(line: 64, column: 15, scope: !105)
!108 = !DILocation(line: 65, column: 10, scope: !105)
!109 = !DILocation(line: 66, column: 5, scope: !105)
!110 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !17, line: 69, type: !4)
!111 = distinct !DILexicalBlock(scope: !112, file: !17, line: 68, column: 9)
!112 = distinct !DILexicalBlock(scope: !105, file: !17, line: 67, column: 5)
!113 = !DILocation(line: 69, column: 23, scope: !111)
!114 = !DILocation(line: 69, column: 47, scope: !111)
!115 = !DILocation(line: 69, column: 36, scope: !111)
!116 = !DILocation(line: 70, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !17, line: 70, column: 17)
!118 = !DILocation(line: 70, column: 28, scope: !117)
!119 = !DILocation(line: 70, column: 17, scope: !111)
!120 = !DILocation(line: 70, column: 38, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 70, column: 37)
!122 = !DILocation(line: 71, column: 21, scope: !111)
!123 = !DILocation(line: 71, column: 13, scope: !111)
!124 = !DILocation(line: 72, column: 13, scope: !111)
!125 = !DILocation(line: 72, column: 31, scope: !111)
!126 = !DILocation(line: 74, column: 20, scope: !111)
!127 = !DILocation(line: 74, column: 18, scope: !111)
!128 = !DILocation(line: 76, column: 9, scope: !112)
!129 = !DILocalVariable(name: "i", scope: !130, file: !17, line: 79, type: !46)
!130 = distinct !DILexicalBlock(scope: !105, file: !17, line: 78, column: 5)
!131 = !DILocation(line: 79, column: 16, scope: !130)
!132 = !DILocalVariable(name: "source", scope: !130, file: !17, line: 80, type: !50)
!133 = !DILocation(line: 80, column: 17, scope: !130)
!134 = !DILocation(line: 81, column: 17, scope: !130)
!135 = !DILocation(line: 81, column: 9, scope: !130)
!136 = !DILocation(line: 82, column: 9, scope: !130)
!137 = !DILocation(line: 82, column: 23, scope: !130)
!138 = !DILocation(line: 84, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !130, file: !17, line: 84, column: 9)
!140 = !DILocation(line: 84, column: 14, scope: !139)
!141 = !DILocation(line: 84, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !17, line: 84, column: 9)
!143 = !DILocation(line: 84, column: 23, scope: !142)
!144 = !DILocation(line: 84, column: 9, scope: !139)
!145 = !DILocation(line: 86, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !17, line: 85, column: 9)
!147 = !DILocation(line: 86, column: 23, scope: !146)
!148 = !DILocation(line: 86, column: 13, scope: !146)
!149 = !DILocation(line: 86, column: 18, scope: !146)
!150 = !DILocation(line: 86, column: 21, scope: !146)
!151 = !DILocation(line: 87, column: 9, scope: !146)
!152 = !DILocation(line: 84, column: 31, scope: !142)
!153 = !DILocation(line: 84, column: 9, scope: !142)
!154 = distinct !{!154, !144, !155, !76}
!155 = !DILocation(line: 87, column: 9, scope: !139)
!156 = !DILocation(line: 89, column: 9, scope: !130)
!157 = !DILocation(line: 89, column: 21, scope: !130)
!158 = !DILocation(line: 90, column: 20, scope: !130)
!159 = !DILocation(line: 90, column: 9, scope: !130)
!160 = !DILocation(line: 94, column: 1, scope: !105)
