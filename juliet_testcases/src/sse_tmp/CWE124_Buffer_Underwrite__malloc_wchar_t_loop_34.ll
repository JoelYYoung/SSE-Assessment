; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !33
  %0 = bitcast i8* %call to i32*, !dbg !34
  store i32* %0, i32** %dataBuffer, align 8, !dbg !32
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i32* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !42
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !45
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !46
  store i32* %add.ptr, i32** %data, align 8, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !49
  store i32* %5, i32** %unionFirst, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !51, metadata !DIExpression()), !dbg !53
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !54
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !54
  store i32* %6, i32** %data2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !60, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !65
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !66
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx4, align 4, !dbg !68
  store i64 0, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !72
  %cmp5 = icmp ult i64 %7, 100, !dbg !74
  br i1 %cmp5, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !78
  %9 = load i32, i32* %arrayidx6, align 4, !dbg !78
  %10 = load i32*, i32** %data2, align 8, !dbg !79
  %11 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !79
  store i32 %9, i32* %arrayidx7, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %12, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !88
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !88
  store i32 0, i32* %arrayidx8, align 4, !dbg !89
  %14 = load i32*, i32** %data2, align 8, !dbg !90
  call void @printWLine(i32* %14), !dbg !91
  ret void, !dbg !92
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #5, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #5, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType* %myUnion, metadata !119, metadata !DIExpression()), !dbg !120
  store i32* null, i32** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !122, metadata !DIExpression()), !dbg !124
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !125
  %0 = bitcast i8* %call to i32*, !dbg !126
  store i32* %0, i32** %dataBuffer, align 8, !dbg !124
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !127
  %cmp = icmp eq i32* %1, null, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !131
  unreachable, !dbg !131

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !133
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !134
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !137
  store i32* %4, i32** %data, align 8, !dbg !138
  %5 = load i32*, i32** %data, align 8, !dbg !139
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !140
  store i32* %5, i32** %unionFirst, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !142, metadata !DIExpression()), !dbg !144
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !145
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !145
  store i32* %6, i32** %data2, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !151
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !152
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx4, align 4, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !158
  %cmp5 = icmp ult i64 %7, 100, !dbg !160
  br i1 %cmp5, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !164
  %9 = load i32, i32* %arrayidx6, align 4, !dbg !164
  %10 = load i32*, i32** %data2, align 8, !dbg !165
  %11 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !165
  store i32 %9, i32* %arrayidx7, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %12, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !173
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !173
  store i32 0, i32* %arrayidx8, align 4, !dbg !174
  %14 = load i32*, i32** %data2, align 8, !dbg !175
  call void @printWLine(i32* %14), !dbg !176
  ret void, !dbg !177
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 64, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !17, line: 35, type: !4)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!32 = !DILocation(line: 35, column: 19, scope: !31)
!33 = !DILocation(line: 35, column: 43, scope: !31)
!34 = !DILocation(line: 35, column: 32, scope: !31)
!35 = !DILocation(line: 36, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !17, line: 36, column: 13)
!37 = !DILocation(line: 36, column: 24, scope: !36)
!38 = !DILocation(line: 36, column: 13, scope: !31)
!39 = !DILocation(line: 36, column: 34, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !17, line: 36, column: 33)
!41 = !DILocation(line: 37, column: 17, scope: !31)
!42 = !DILocation(line: 37, column: 9, scope: !31)
!43 = !DILocation(line: 38, column: 9, scope: !31)
!44 = !DILocation(line: 38, column: 27, scope: !31)
!45 = !DILocation(line: 40, column: 16, scope: !31)
!46 = !DILocation(line: 40, column: 27, scope: !31)
!47 = !DILocation(line: 40, column: 14, scope: !31)
!48 = !DILocation(line: 42, column: 26, scope: !16)
!49 = !DILocation(line: 42, column: 13, scope: !16)
!50 = !DILocation(line: 42, column: 24, scope: !16)
!51 = !DILocalVariable(name: "data", scope: !52, file: !17, line: 44, type: !4)
!52 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!53 = !DILocation(line: 44, column: 19, scope: !52)
!54 = !DILocation(line: 44, column: 34, scope: !52)
!55 = !DILocalVariable(name: "i", scope: !56, file: !17, line: 46, type: !57)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 45, column: 9)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !58)
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 46, column: 20, scope: !56)
!60 = !DILocalVariable(name: "source", scope: !56, file: !17, line: 47, type: !61)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 100)
!64 = !DILocation(line: 47, column: 21, scope: !56)
!65 = !DILocation(line: 48, column: 21, scope: !56)
!66 = !DILocation(line: 48, column: 13, scope: !56)
!67 = !DILocation(line: 49, column: 13, scope: !56)
!68 = !DILocation(line: 49, column: 27, scope: !56)
!69 = !DILocation(line: 51, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !56, file: !17, line: 51, column: 13)
!71 = !DILocation(line: 51, column: 18, scope: !70)
!72 = !DILocation(line: 51, column: 25, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !17, line: 51, column: 13)
!74 = !DILocation(line: 51, column: 27, scope: !73)
!75 = !DILocation(line: 51, column: 13, scope: !70)
!76 = !DILocation(line: 53, column: 34, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !17, line: 52, column: 13)
!78 = !DILocation(line: 53, column: 27, scope: !77)
!79 = !DILocation(line: 53, column: 17, scope: !77)
!80 = !DILocation(line: 53, column: 22, scope: !77)
!81 = !DILocation(line: 53, column: 25, scope: !77)
!82 = !DILocation(line: 54, column: 13, scope: !77)
!83 = !DILocation(line: 51, column: 35, scope: !73)
!84 = !DILocation(line: 51, column: 13, scope: !73)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 54, column: 13, scope: !70)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 56, column: 13, scope: !56)
!89 = !DILocation(line: 56, column: 25, scope: !56)
!90 = !DILocation(line: 57, column: 24, scope: !56)
!91 = !DILocation(line: 57, column: 13, scope: !56)
!92 = !DILocation(line: 62, column: 1, scope: !16)
!93 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_34_good", scope: !17, file: !17, line: 104, type: !18, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 106, column: 5, scope: !93)
!95 = !DILocation(line: 107, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 118, type: !97, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!7, !7, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !17, line: 118, type: !7)
!103 = !DILocation(line: 118, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !17, line: 118, type: !99)
!105 = !DILocation(line: 118, column: 27, scope: !96)
!106 = !DILocation(line: 121, column: 22, scope: !96)
!107 = !DILocation(line: 121, column: 12, scope: !96)
!108 = !DILocation(line: 121, column: 5, scope: !96)
!109 = !DILocation(line: 123, column: 5, scope: !96)
!110 = !DILocation(line: 124, column: 5, scope: !96)
!111 = !DILocation(line: 125, column: 5, scope: !96)
!112 = !DILocation(line: 128, column: 5, scope: !96)
!113 = !DILocation(line: 129, column: 5, scope: !96)
!114 = !DILocation(line: 130, column: 5, scope: !96)
!115 = !DILocation(line: 132, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 69, type: !18, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !17, line: 71, type: !4)
!118 = !DILocation(line: 71, column: 15, scope: !116)
!119 = !DILocalVariable(name: "myUnion", scope: !116, file: !17, line: 72, type: !23)
!120 = !DILocation(line: 72, column: 64, scope: !116)
!121 = !DILocation(line: 73, column: 10, scope: !116)
!122 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !17, line: 75, type: !4)
!123 = distinct !DILexicalBlock(scope: !116, file: !17, line: 74, column: 5)
!124 = !DILocation(line: 75, column: 19, scope: !123)
!125 = !DILocation(line: 75, column: 43, scope: !123)
!126 = !DILocation(line: 75, column: 32, scope: !123)
!127 = !DILocation(line: 76, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !17, line: 76, column: 13)
!129 = !DILocation(line: 76, column: 24, scope: !128)
!130 = !DILocation(line: 76, column: 13, scope: !123)
!131 = !DILocation(line: 76, column: 34, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !17, line: 76, column: 33)
!133 = !DILocation(line: 77, column: 17, scope: !123)
!134 = !DILocation(line: 77, column: 9, scope: !123)
!135 = !DILocation(line: 78, column: 9, scope: !123)
!136 = !DILocation(line: 78, column: 27, scope: !123)
!137 = !DILocation(line: 80, column: 16, scope: !123)
!138 = !DILocation(line: 80, column: 14, scope: !123)
!139 = !DILocation(line: 82, column: 26, scope: !116)
!140 = !DILocation(line: 82, column: 13, scope: !116)
!141 = !DILocation(line: 82, column: 24, scope: !116)
!142 = !DILocalVariable(name: "data", scope: !143, file: !17, line: 84, type: !4)
!143 = distinct !DILexicalBlock(scope: !116, file: !17, line: 83, column: 5)
!144 = !DILocation(line: 84, column: 19, scope: !143)
!145 = !DILocation(line: 84, column: 34, scope: !143)
!146 = !DILocalVariable(name: "i", scope: !147, file: !17, line: 86, type: !57)
!147 = distinct !DILexicalBlock(scope: !143, file: !17, line: 85, column: 9)
!148 = !DILocation(line: 86, column: 20, scope: !147)
!149 = !DILocalVariable(name: "source", scope: !147, file: !17, line: 87, type: !61)
!150 = !DILocation(line: 87, column: 21, scope: !147)
!151 = !DILocation(line: 88, column: 21, scope: !147)
!152 = !DILocation(line: 88, column: 13, scope: !147)
!153 = !DILocation(line: 89, column: 13, scope: !147)
!154 = !DILocation(line: 89, column: 27, scope: !147)
!155 = !DILocation(line: 91, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !147, file: !17, line: 91, column: 13)
!157 = !DILocation(line: 91, column: 18, scope: !156)
!158 = !DILocation(line: 91, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !17, line: 91, column: 13)
!160 = !DILocation(line: 91, column: 27, scope: !159)
!161 = !DILocation(line: 91, column: 13, scope: !156)
!162 = !DILocation(line: 93, column: 34, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !17, line: 92, column: 13)
!164 = !DILocation(line: 93, column: 27, scope: !163)
!165 = !DILocation(line: 93, column: 17, scope: !163)
!166 = !DILocation(line: 93, column: 22, scope: !163)
!167 = !DILocation(line: 93, column: 25, scope: !163)
!168 = !DILocation(line: 94, column: 13, scope: !163)
!169 = !DILocation(line: 91, column: 35, scope: !159)
!170 = !DILocation(line: 91, column: 13, scope: !159)
!171 = distinct !{!171, !161, !172, !87}
!172 = !DILocation(line: 94, column: 13, scope: !156)
!173 = !DILocation(line: 96, column: 13, scope: !147)
!174 = !DILocation(line: 96, column: 25, scope: !147)
!175 = !DILocation(line: 97, column: 24, scope: !147)
!176 = !DILocation(line: 97, column: 13, scope: !147)
!177 = !DILocation(line: 102, column: 1, scope: !116)
