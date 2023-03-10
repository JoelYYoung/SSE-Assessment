; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !37
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx3, align 4, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %6 = bitcast i32* %5 to i8*, !dbg !54
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %9), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* null, i32** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !92
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !93
  %0 = bitcast i8* %call to i32*, !dbg !94
  store i32* %0, i32** %dataBuffer, align 8, !dbg !92
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !102
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  store i32* %4, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !111
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx3, align 4, !dbg !113
  %5 = load i32*, i32** %data, align 8, !dbg !114
  %6 = bitcast i32* %5 to i8*, !dbg !115
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !115
  %8 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !116
  store i32 0, i32* %arrayidx5, align 4, !dbg !117
  %9 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* %9), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i32* null, i32** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !125, metadata !DIExpression()), !dbg !129
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !130
  %0 = bitcast i8* %call to i32*, !dbg !131
  store i32* %0, i32** %dataBuffer, align 8, !dbg !129
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %cmp = icmp eq i32* %1, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !139
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !140
  store i32 0, i32* %arrayidx, align 4, !dbg !141
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !142
  store i32* %4, i32** %data, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !144, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !147
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !148
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx3, align 4, !dbg !150
  %5 = load i32*, i32** %data, align 8, !dbg !151
  %6 = bitcast i32* %5 to i8*, !dbg !152
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !152
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !152
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !152
  %8 = load i32*, i32** %data, align 8, !dbg !153
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %9 = load i32*, i32** %data, align 8, !dbg !155
  call void @printWLine(i32* %9), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04_bad", scope: !17, file: !17, line: 30, type: !18, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 32, type: !4)
!21 = !DILocation(line: 32, column: 15, scope: !16)
!22 = !DILocation(line: 33, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 37, type: !4)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 36, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !17, line: 35, column: 5)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 8)
!27 = !DILocation(line: 37, column: 23, scope: !24)
!28 = !DILocation(line: 37, column: 47, scope: !24)
!29 = !DILocation(line: 37, column: 36, scope: !24)
!30 = !DILocation(line: 38, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !17, line: 38, column: 17)
!32 = !DILocation(line: 38, column: 28, scope: !31)
!33 = !DILocation(line: 38, column: 17, scope: !24)
!34 = !DILocation(line: 38, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 38, column: 37)
!36 = !DILocation(line: 39, column: 21, scope: !24)
!37 = !DILocation(line: 39, column: 13, scope: !24)
!38 = !DILocation(line: 40, column: 13, scope: !24)
!39 = !DILocation(line: 40, column: 31, scope: !24)
!40 = !DILocation(line: 42, column: 20, scope: !24)
!41 = !DILocation(line: 42, column: 31, scope: !24)
!42 = !DILocation(line: 42, column: 18, scope: !24)
!43 = !DILocalVariable(name: "source", scope: !44, file: !17, line: 46, type: !45)
!44 = distinct !DILexicalBlock(scope: !16, file: !17, line: 45, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 46, column: 17, scope: !44)
!49 = !DILocation(line: 47, column: 17, scope: !44)
!50 = !DILocation(line: 47, column: 9, scope: !44)
!51 = !DILocation(line: 48, column: 9, scope: !44)
!52 = !DILocation(line: 48, column: 23, scope: !44)
!53 = !DILocation(line: 50, column: 16, scope: !44)
!54 = !DILocation(line: 50, column: 9, scope: !44)
!55 = !DILocation(line: 52, column: 9, scope: !44)
!56 = !DILocation(line: 52, column: 21, scope: !44)
!57 = !DILocation(line: 53, column: 20, scope: !44)
!58 = !DILocation(line: 53, column: 9, scope: !44)
!59 = !DILocation(line: 57, column: 1, scope: !16)
!60 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_04_good", scope: !17, file: !17, line: 128, type: !18, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 130, column: 5, scope: !60)
!62 = !DILocation(line: 131, column: 5, scope: !60)
!63 = !DILocation(line: 132, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 144, type: !65, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !17, line: 144, type: !7)
!71 = !DILocation(line: 144, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !17, line: 144, type: !67)
!73 = !DILocation(line: 144, column: 27, scope: !64)
!74 = !DILocation(line: 147, column: 22, scope: !64)
!75 = !DILocation(line: 147, column: 12, scope: !64)
!76 = !DILocation(line: 147, column: 5, scope: !64)
!77 = !DILocation(line: 149, column: 5, scope: !64)
!78 = !DILocation(line: 150, column: 5, scope: !64)
!79 = !DILocation(line: 151, column: 5, scope: !64)
!80 = !DILocation(line: 154, column: 5, scope: !64)
!81 = !DILocation(line: 155, column: 5, scope: !64)
!82 = !DILocation(line: 156, column: 5, scope: !64)
!83 = !DILocation(line: 158, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !17, line: 66, type: !4)
!86 = !DILocation(line: 66, column: 15, scope: !84)
!87 = !DILocation(line: 67, column: 10, scope: !84)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !17, line: 76, type: !4)
!89 = distinct !DILexicalBlock(scope: !90, file: !17, line: 75, column: 9)
!90 = distinct !DILexicalBlock(scope: !91, file: !17, line: 74, column: 5)
!91 = distinct !DILexicalBlock(scope: !84, file: !17, line: 68, column: 8)
!92 = !DILocation(line: 76, column: 23, scope: !89)
!93 = !DILocation(line: 76, column: 47, scope: !89)
!94 = !DILocation(line: 76, column: 36, scope: !89)
!95 = !DILocation(line: 77, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !17, line: 77, column: 17)
!97 = !DILocation(line: 77, column: 28, scope: !96)
!98 = !DILocation(line: 77, column: 17, scope: !89)
!99 = !DILocation(line: 77, column: 38, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 77, column: 37)
!101 = !DILocation(line: 78, column: 21, scope: !89)
!102 = !DILocation(line: 78, column: 13, scope: !89)
!103 = !DILocation(line: 79, column: 13, scope: !89)
!104 = !DILocation(line: 79, column: 31, scope: !89)
!105 = !DILocation(line: 81, column: 20, scope: !89)
!106 = !DILocation(line: 81, column: 18, scope: !89)
!107 = !DILocalVariable(name: "source", scope: !108, file: !17, line: 85, type: !45)
!108 = distinct !DILexicalBlock(scope: !84, file: !17, line: 84, column: 5)
!109 = !DILocation(line: 85, column: 17, scope: !108)
!110 = !DILocation(line: 86, column: 17, scope: !108)
!111 = !DILocation(line: 86, column: 9, scope: !108)
!112 = !DILocation(line: 87, column: 9, scope: !108)
!113 = !DILocation(line: 87, column: 23, scope: !108)
!114 = !DILocation(line: 89, column: 16, scope: !108)
!115 = !DILocation(line: 89, column: 9, scope: !108)
!116 = !DILocation(line: 91, column: 9, scope: !108)
!117 = !DILocation(line: 91, column: 21, scope: !108)
!118 = !DILocation(line: 92, column: 20, scope: !108)
!119 = !DILocation(line: 92, column: 9, scope: !108)
!120 = !DILocation(line: 96, column: 1, scope: !84)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 99, type: !18, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !17, line: 101, type: !4)
!123 = !DILocation(line: 101, column: 15, scope: !121)
!124 = !DILocation(line: 102, column: 10, scope: !121)
!125 = !DILocalVariable(name: "dataBuffer", scope: !126, file: !17, line: 106, type: !4)
!126 = distinct !DILexicalBlock(scope: !127, file: !17, line: 105, column: 9)
!127 = distinct !DILexicalBlock(scope: !128, file: !17, line: 104, column: 5)
!128 = distinct !DILexicalBlock(scope: !121, file: !17, line: 103, column: 8)
!129 = !DILocation(line: 106, column: 23, scope: !126)
!130 = !DILocation(line: 106, column: 47, scope: !126)
!131 = !DILocation(line: 106, column: 36, scope: !126)
!132 = !DILocation(line: 107, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !17, line: 107, column: 17)
!134 = !DILocation(line: 107, column: 28, scope: !133)
!135 = !DILocation(line: 107, column: 17, scope: !126)
!136 = !DILocation(line: 107, column: 38, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !17, line: 107, column: 37)
!138 = !DILocation(line: 108, column: 21, scope: !126)
!139 = !DILocation(line: 108, column: 13, scope: !126)
!140 = !DILocation(line: 109, column: 13, scope: !126)
!141 = !DILocation(line: 109, column: 31, scope: !126)
!142 = !DILocation(line: 111, column: 20, scope: !126)
!143 = !DILocation(line: 111, column: 18, scope: !126)
!144 = !DILocalVariable(name: "source", scope: !145, file: !17, line: 115, type: !45)
!145 = distinct !DILexicalBlock(scope: !121, file: !17, line: 114, column: 5)
!146 = !DILocation(line: 115, column: 17, scope: !145)
!147 = !DILocation(line: 116, column: 17, scope: !145)
!148 = !DILocation(line: 116, column: 9, scope: !145)
!149 = !DILocation(line: 117, column: 9, scope: !145)
!150 = !DILocation(line: 117, column: 23, scope: !145)
!151 = !DILocation(line: 119, column: 16, scope: !145)
!152 = !DILocation(line: 119, column: 9, scope: !145)
!153 = !DILocation(line: 121, column: 9, scope: !145)
!154 = !DILocation(line: 121, column: 21, scope: !145)
!155 = !DILocation(line: 122, column: 20, scope: !145)
!156 = !DILocation(line: 122, column: 9, scope: !145)
!157 = !DILocation(line: 126, column: 1, scope: !121)
