; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_01_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx3, align 4, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !53
  store i64 %call5, i64* %destLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !58
  %5 = load i64, i64* %destLen, align 8, !dbg !60
  %cmp6 = icmp ult i64 %4, %5, !dbg !61
  br i1 %cmp6, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !63
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !63
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !67
  store i32 %8, i32* %arrayidx8, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %10, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !75
  store i32 0, i32* %arrayidx9, align 4, !dbg !76
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !77
  call void @printWLine(i32* %arraydecay10), !dbg !78
  %11 = load i32*, i32** %data, align 8, !dbg !79
  %12 = bitcast i32* %11 to i8*, !dbg !79
  call void @free(i8* %12) #6, !dbg !80
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_01_good() #0 !dbg !82 {
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
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_01_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_01_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %data, align 8, !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !109
  %0 = bitcast i8* %call to i32*, !dbg !110
  store i32* %0, i32** %data, align 8, !dbg !111
  %1 = load i32*, i32** %data, align 8, !dbg !112
  %cmp = icmp eq i32* %1, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !118
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !119
  %3 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !130
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx3, align 4, !dbg !132
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !134
  store i64 %call5, i64* %destLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !139
  %5 = load i64, i64* %destLen, align 8, !dbg !141
  %cmp6 = icmp ult i64 %4, %5, !dbg !142
  br i1 %cmp6, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !144
  %7 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !144
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !144
  %9 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !148
  store i32 %8, i32* %arrayidx8, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %10, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !155
  store i32 0, i32* %arrayidx9, align 4, !dbg !156
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  call void @printWLine(i32* %arraydecay10), !dbg !158
  %11 = load i32*, i32** %data, align 8, !dbg !159
  %12 = bitcast i32* %11 to i8*, !dbg !159
  call void @free(i8* %12) #6, !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_01_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_01.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 28, column: 23, scope: !16)
!24 = !DILocation(line: 28, column: 12, scope: !16)
!25 = !DILocation(line: 28, column: 10, scope: !16)
!26 = !DILocation(line: 29, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!28 = !DILocation(line: 29, column: 14, scope: !27)
!29 = !DILocation(line: 29, column: 9, scope: !16)
!30 = !DILocation(line: 29, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 29, column: 23)
!32 = !DILocation(line: 30, column: 13, scope: !16)
!33 = !DILocation(line: 30, column: 5, scope: !16)
!34 = !DILocation(line: 31, column: 5, scope: !16)
!35 = !DILocation(line: 31, column: 16, scope: !16)
!36 = !DILocalVariable(name: "i", scope: !37, file: !17, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 33, column: 16, scope: !37)
!41 = !DILocalVariable(name: "destLen", scope: !37, file: !17, line: 33, type: !38)
!42 = !DILocation(line: 33, column: 19, scope: !37)
!43 = !DILocalVariable(name: "dest", scope: !37, file: !17, line: 34, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 34, column: 17, scope: !37)
!48 = !DILocation(line: 35, column: 17, scope: !37)
!49 = !DILocation(line: 35, column: 9, scope: !37)
!50 = !DILocation(line: 36, column: 9, scope: !37)
!51 = !DILocation(line: 36, column: 21, scope: !37)
!52 = !DILocation(line: 37, column: 26, scope: !37)
!53 = !DILocation(line: 37, column: 19, scope: !37)
!54 = !DILocation(line: 37, column: 17, scope: !37)
!55 = !DILocation(line: 40, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !37, file: !17, line: 40, column: 9)
!57 = !DILocation(line: 40, column: 14, scope: !56)
!58 = !DILocation(line: 40, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !17, line: 40, column: 9)
!60 = !DILocation(line: 40, column: 25, scope: !59)
!61 = !DILocation(line: 40, column: 23, scope: !59)
!62 = !DILocation(line: 40, column: 9, scope: !56)
!63 = !DILocation(line: 42, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !17, line: 41, column: 9)
!65 = !DILocation(line: 42, column: 28, scope: !64)
!66 = !DILocation(line: 42, column: 18, scope: !64)
!67 = !DILocation(line: 42, column: 13, scope: !64)
!68 = !DILocation(line: 42, column: 21, scope: !64)
!69 = !DILocation(line: 43, column: 9, scope: !64)
!70 = !DILocation(line: 40, column: 35, scope: !59)
!71 = !DILocation(line: 40, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 43, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 44, column: 9, scope: !37)
!76 = !DILocation(line: 44, column: 21, scope: !37)
!77 = !DILocation(line: 45, column: 20, scope: !37)
!78 = !DILocation(line: 45, column: 9, scope: !37)
!79 = !DILocation(line: 46, column: 14, scope: !37)
!80 = !DILocation(line: 46, column: 9, scope: !37)
!81 = !DILocation(line: 48, column: 1, scope: !16)
!82 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_01_good", scope: !17, file: !17, line: 82, type: !18, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 84, column: 5, scope: !82)
!84 = !DILocation(line: 85, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 97, type: !86, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!7, !7, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !17, line: 97, type: !7)
!92 = !DILocation(line: 97, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !17, line: 97, type: !88)
!94 = !DILocation(line: 97, column: 27, scope: !85)
!95 = !DILocation(line: 100, column: 22, scope: !85)
!96 = !DILocation(line: 100, column: 12, scope: !85)
!97 = !DILocation(line: 100, column: 5, scope: !85)
!98 = !DILocation(line: 102, column: 5, scope: !85)
!99 = !DILocation(line: 103, column: 5, scope: !85)
!100 = !DILocation(line: 104, column: 5, scope: !85)
!101 = !DILocation(line: 107, column: 5, scope: !85)
!102 = !DILocation(line: 108, column: 5, scope: !85)
!103 = !DILocation(line: 109, column: 5, scope: !85)
!104 = !DILocation(line: 111, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 57, type: !4)
!107 = !DILocation(line: 57, column: 15, scope: !105)
!108 = !DILocation(line: 58, column: 10, scope: !105)
!109 = !DILocation(line: 60, column: 23, scope: !105)
!110 = !DILocation(line: 60, column: 12, scope: !105)
!111 = !DILocation(line: 60, column: 10, scope: !105)
!112 = !DILocation(line: 61, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !17, line: 61, column: 9)
!114 = !DILocation(line: 61, column: 14, scope: !113)
!115 = !DILocation(line: 61, column: 9, scope: !105)
!116 = !DILocation(line: 61, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 61, column: 23)
!118 = !DILocation(line: 62, column: 13, scope: !105)
!119 = !DILocation(line: 62, column: 5, scope: !105)
!120 = !DILocation(line: 63, column: 5, scope: !105)
!121 = !DILocation(line: 63, column: 17, scope: !105)
!122 = !DILocalVariable(name: "i", scope: !123, file: !17, line: 65, type: !38)
!123 = distinct !DILexicalBlock(scope: !105, file: !17, line: 64, column: 5)
!124 = !DILocation(line: 65, column: 16, scope: !123)
!125 = !DILocalVariable(name: "destLen", scope: !123, file: !17, line: 65, type: !38)
!126 = !DILocation(line: 65, column: 19, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !123, file: !17, line: 66, type: !44)
!128 = !DILocation(line: 66, column: 17, scope: !123)
!129 = !DILocation(line: 67, column: 17, scope: !123)
!130 = !DILocation(line: 67, column: 9, scope: !123)
!131 = !DILocation(line: 68, column: 9, scope: !123)
!132 = !DILocation(line: 68, column: 21, scope: !123)
!133 = !DILocation(line: 69, column: 26, scope: !123)
!134 = !DILocation(line: 69, column: 19, scope: !123)
!135 = !DILocation(line: 69, column: 17, scope: !123)
!136 = !DILocation(line: 72, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !123, file: !17, line: 72, column: 9)
!138 = !DILocation(line: 72, column: 14, scope: !137)
!139 = !DILocation(line: 72, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !17, line: 72, column: 9)
!141 = !DILocation(line: 72, column: 25, scope: !140)
!142 = !DILocation(line: 72, column: 23, scope: !140)
!143 = !DILocation(line: 72, column: 9, scope: !137)
!144 = !DILocation(line: 74, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !17, line: 73, column: 9)
!146 = !DILocation(line: 74, column: 28, scope: !145)
!147 = !DILocation(line: 74, column: 18, scope: !145)
!148 = !DILocation(line: 74, column: 13, scope: !145)
!149 = !DILocation(line: 74, column: 21, scope: !145)
!150 = !DILocation(line: 75, column: 9, scope: !145)
!151 = !DILocation(line: 72, column: 35, scope: !140)
!152 = !DILocation(line: 72, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !74}
!154 = !DILocation(line: 75, column: 9, scope: !137)
!155 = !DILocation(line: 76, column: 9, scope: !123)
!156 = !DILocation(line: 76, column: 21, scope: !123)
!157 = !DILocation(line: 77, column: 20, scope: !123)
!158 = !DILocation(line: 77, column: 9, scope: !123)
!159 = !DILocation(line: 78, column: 14, scope: !123)
!160 = !DILocation(line: 78, column: 9, scope: !123)
!161 = !DILocation(line: 80, column: 1, scope: !105)
