; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_34.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !31
  store i8* %call, i8** %dataBuffer, align 8, !dbg !30
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i8* %0, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !39
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !43
  store i8* %add.ptr, i8** %data, align 8, !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType* %myUnion to i8**, !dbg !46
  store i8* %4, i8** %unionFirst, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !48, metadata !DIExpression()), !dbg !50
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType* %myUnion to i8**, !dbg !51
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !51
  store i8* %5, i8** %data1, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !58, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !63
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !64
  store i8 0, i8* %arrayidx2, align 1, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !69
  %cmp3 = icmp ult i64 %6, 100, !dbg !71
  br i1 %cmp3, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !75
  %8 = load i8, i8* %arrayidx4, align 1, !dbg !75
  %9 = load i8*, i8** %data1, align 8, !dbg !76
  %10 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !76
  store i8 %8, i8* %arrayidx5, align 1, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %11, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !85
  %arrayidx6 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !85
  store i8 0, i8* %arrayidx6, align 1, !dbg !86
  %13 = load i8*, i8** %data1, align 8, !dbg !87
  call void @printLine(i8* %13), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_34_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #6, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #6, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_34_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_34_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType* %myUnion, metadata !115, metadata !DIExpression()), !dbg !116
  store i8* null, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !120
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !121
  store i8* %call, i8** %dataBuffer, align 8, !dbg !120
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !122
  %cmp = icmp eq i8* %0, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !129
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  store i8* %3, i8** %data, align 8, !dbg !133
  %4 = load i8*, i8** %data, align 8, !dbg !134
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType* %myUnion to i8**, !dbg !135
  store i8* %4, i8** %unionFirst, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !137, metadata !DIExpression()), !dbg !139
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType* %myUnion to i8**, !dbg !140
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !140
  store i8* %5, i8** %data1, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !146
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !147
  store i8 0, i8* %arrayidx2, align 1, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !152
  %cmp3 = icmp ult i64 %6, 100, !dbg !154
  br i1 %cmp3, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !158
  %8 = load i8, i8* %arrayidx4, align 1, !dbg !158
  %9 = load i8*, i8** %data1, align 8, !dbg !159
  %10 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !159
  store i8 %8, i8* %arrayidx5, align 1, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %11, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !167
  %arrayidx6 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !167
  store i8 0, i8* %arrayidx6, align 1, !dbg !168
  %13 = load i8*, i8** %data1, align 8, !dbg !169
  call void @printLine(i8* %13), !dbg !170
  ret void, !dbg !171
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__malloc_char_loop_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 61, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !15, line: 35, type: !4)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!30 = !DILocation(line: 35, column: 16, scope: !29)
!31 = !DILocation(line: 35, column: 37, scope: !29)
!32 = !DILocation(line: 36, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 36, column: 13)
!34 = !DILocation(line: 36, column: 24, scope: !33)
!35 = !DILocation(line: 36, column: 13, scope: !29)
!36 = !DILocation(line: 36, column: 34, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 36, column: 33)
!38 = !DILocation(line: 37, column: 16, scope: !29)
!39 = !DILocation(line: 37, column: 9, scope: !29)
!40 = !DILocation(line: 38, column: 9, scope: !29)
!41 = !DILocation(line: 38, column: 27, scope: !29)
!42 = !DILocation(line: 40, column: 16, scope: !29)
!43 = !DILocation(line: 40, column: 27, scope: !29)
!44 = !DILocation(line: 40, column: 14, scope: !29)
!45 = !DILocation(line: 42, column: 26, scope: !14)
!46 = !DILocation(line: 42, column: 13, scope: !14)
!47 = !DILocation(line: 42, column: 24, scope: !14)
!48 = !DILocalVariable(name: "data", scope: !49, file: !15, line: 44, type: !4)
!49 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!50 = !DILocation(line: 44, column: 16, scope: !49)
!51 = !DILocation(line: 44, column: 31, scope: !49)
!52 = !DILocalVariable(name: "i", scope: !53, file: !15, line: 46, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 45, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 46, column: 20, scope: !53)
!58 = !DILocalVariable(name: "source", scope: !53, file: !15, line: 47, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 100)
!62 = !DILocation(line: 47, column: 18, scope: !53)
!63 = !DILocation(line: 48, column: 13, scope: !53)
!64 = !DILocation(line: 49, column: 13, scope: !53)
!65 = !DILocation(line: 49, column: 27, scope: !53)
!66 = !DILocation(line: 51, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !53, file: !15, line: 51, column: 13)
!68 = !DILocation(line: 51, column: 18, scope: !67)
!69 = !DILocation(line: 51, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !15, line: 51, column: 13)
!71 = !DILocation(line: 51, column: 27, scope: !70)
!72 = !DILocation(line: 51, column: 13, scope: !67)
!73 = !DILocation(line: 53, column: 34, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 52, column: 13)
!75 = !DILocation(line: 53, column: 27, scope: !74)
!76 = !DILocation(line: 53, column: 17, scope: !74)
!77 = !DILocation(line: 53, column: 22, scope: !74)
!78 = !DILocation(line: 53, column: 25, scope: !74)
!79 = !DILocation(line: 54, column: 13, scope: !74)
!80 = !DILocation(line: 51, column: 35, scope: !70)
!81 = !DILocation(line: 51, column: 13, scope: !70)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 54, column: 13, scope: !67)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 56, column: 13, scope: !53)
!86 = !DILocation(line: 56, column: 25, scope: !53)
!87 = !DILocation(line: 57, column: 23, scope: !53)
!88 = !DILocation(line: 57, column: 13, scope: !53)
!89 = !DILocation(line: 62, column: 1, scope: !14)
!90 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_34_good", scope: !15, file: !15, line: 104, type: !16, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 106, column: 5, scope: !90)
!92 = !DILocation(line: 107, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 118, type: !94, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!96, !96, !97}
!96 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !15, line: 118, type: !96)
!99 = !DILocation(line: 118, column: 14, scope: !93)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !15, line: 118, type: !97)
!101 = !DILocation(line: 118, column: 27, scope: !93)
!102 = !DILocation(line: 121, column: 22, scope: !93)
!103 = !DILocation(line: 121, column: 12, scope: !93)
!104 = !DILocation(line: 121, column: 5, scope: !93)
!105 = !DILocation(line: 123, column: 5, scope: !93)
!106 = !DILocation(line: 124, column: 5, scope: !93)
!107 = !DILocation(line: 125, column: 5, scope: !93)
!108 = !DILocation(line: 128, column: 5, scope: !93)
!109 = !DILocation(line: 129, column: 5, scope: !93)
!110 = !DILocation(line: 130, column: 5, scope: !93)
!111 = !DILocation(line: 132, column: 5, scope: !93)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 69, type: !16, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 71, type: !4)
!114 = !DILocation(line: 71, column: 12, scope: !112)
!115 = !DILocalVariable(name: "myUnion", scope: !112, file: !15, line: 72, type: !21)
!116 = !DILocation(line: 72, column: 61, scope: !112)
!117 = !DILocation(line: 73, column: 10, scope: !112)
!118 = !DILocalVariable(name: "dataBuffer", scope: !119, file: !15, line: 75, type: !4)
!119 = distinct !DILexicalBlock(scope: !112, file: !15, line: 74, column: 5)
!120 = !DILocation(line: 75, column: 16, scope: !119)
!121 = !DILocation(line: 75, column: 37, scope: !119)
!122 = !DILocation(line: 76, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 76, column: 13)
!124 = !DILocation(line: 76, column: 24, scope: !123)
!125 = !DILocation(line: 76, column: 13, scope: !119)
!126 = !DILocation(line: 76, column: 34, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 76, column: 33)
!128 = !DILocation(line: 77, column: 16, scope: !119)
!129 = !DILocation(line: 77, column: 9, scope: !119)
!130 = !DILocation(line: 78, column: 9, scope: !119)
!131 = !DILocation(line: 78, column: 27, scope: !119)
!132 = !DILocation(line: 80, column: 16, scope: !119)
!133 = !DILocation(line: 80, column: 14, scope: !119)
!134 = !DILocation(line: 82, column: 26, scope: !112)
!135 = !DILocation(line: 82, column: 13, scope: !112)
!136 = !DILocation(line: 82, column: 24, scope: !112)
!137 = !DILocalVariable(name: "data", scope: !138, file: !15, line: 84, type: !4)
!138 = distinct !DILexicalBlock(scope: !112, file: !15, line: 83, column: 5)
!139 = !DILocation(line: 84, column: 16, scope: !138)
!140 = !DILocation(line: 84, column: 31, scope: !138)
!141 = !DILocalVariable(name: "i", scope: !142, file: !15, line: 86, type: !54)
!142 = distinct !DILexicalBlock(scope: !138, file: !15, line: 85, column: 9)
!143 = !DILocation(line: 86, column: 20, scope: !142)
!144 = !DILocalVariable(name: "source", scope: !142, file: !15, line: 87, type: !59)
!145 = !DILocation(line: 87, column: 18, scope: !142)
!146 = !DILocation(line: 88, column: 13, scope: !142)
!147 = !DILocation(line: 89, column: 13, scope: !142)
!148 = !DILocation(line: 89, column: 27, scope: !142)
!149 = !DILocation(line: 91, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !15, line: 91, column: 13)
!151 = !DILocation(line: 91, column: 18, scope: !150)
!152 = !DILocation(line: 91, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !15, line: 91, column: 13)
!154 = !DILocation(line: 91, column: 27, scope: !153)
!155 = !DILocation(line: 91, column: 13, scope: !150)
!156 = !DILocation(line: 93, column: 34, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !15, line: 92, column: 13)
!158 = !DILocation(line: 93, column: 27, scope: !157)
!159 = !DILocation(line: 93, column: 17, scope: !157)
!160 = !DILocation(line: 93, column: 22, scope: !157)
!161 = !DILocation(line: 93, column: 25, scope: !157)
!162 = !DILocation(line: 94, column: 13, scope: !157)
!163 = !DILocation(line: 91, column: 35, scope: !153)
!164 = !DILocation(line: 91, column: 13, scope: !153)
!165 = distinct !{!165, !155, !166, !84}
!166 = !DILocation(line: 94, column: 13, scope: !150)
!167 = !DILocation(line: 96, column: 13, scope: !142)
!168 = !DILocation(line: 96, column: 25, scope: !142)
!169 = !DILocation(line: 97, column: 23, scope: !142)
!170 = !DILocation(line: 97, column: 13, scope: !142)
!171 = !DILocation(line: 102, column: 1, scope: !112)
