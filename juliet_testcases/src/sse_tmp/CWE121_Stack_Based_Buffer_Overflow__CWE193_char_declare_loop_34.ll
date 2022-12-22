; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType = type { i8* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i8* %arraydecay, i8** %data, align 8, !dbg !37
  %0 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !41
  store i8* %1, i8** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !46
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !46
  store i8* %2, i8** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !55, metadata !DIExpression()), !dbg !56
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !57
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !58
  store i64 %call, i64* %sourceLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !63
  %5 = load i64, i64* %sourceLen, align 8, !dbg !65
  %add = add i64 %5, 1, !dbg !66
  %cmp = icmp ult i64 %4, %add, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !71
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !71
  %8 = load i8*, i8** %data1, align 8, !dbg !72
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !72
  store i8 %7, i8* %arrayidx4, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %10, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data1, align 8, !dbg !81
  call void @printLine(i8* %11), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType* %myUnion, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !115
  store i8* %arraydecay, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %1 = load i8*, i8** %data, align 8, !dbg !119
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !120
  store i8* %1, i8** %unionFirst, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !122, metadata !DIExpression()), !dbg !124
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType* %myUnion to i8**, !dbg !125
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !125
  store i8* %2, i8** %data1, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !128
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !133
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !134
  store i64 %call, i64* %sourceLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !139
  %5 = load i64, i64* %sourceLen, align 8, !dbg !141
  %add = add i64 %5, 1, !dbg !142
  %cmp = icmp ult i64 %4, %add, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !147
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !147
  %8 = load i8*, i8** %data1, align 8, !dbg !148
  %9 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !148
  store i8 %7, i8* %arrayidx4, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %10, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data1, align 8, !dbg !156
  call void @printLine(i8* %11), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_bad", scope: !12, file: !12, line: 34, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 36, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 36, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 37, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_unionType", file: !12, line: 30, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 26, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 28, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 29, baseType: !16, size: 64)
!25 = !DILocation(line: 37, column: 79, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 38, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 39, column: 10, scope: !11)
!36 = !DILocation(line: 42, column: 12, scope: !11)
!37 = !DILocation(line: 42, column: 10, scope: !11)
!38 = !DILocation(line: 43, column: 5, scope: !11)
!39 = !DILocation(line: 43, column: 13, scope: !11)
!40 = !DILocation(line: 44, column: 26, scope: !11)
!41 = !DILocation(line: 44, column: 13, scope: !11)
!42 = !DILocation(line: 44, column: 24, scope: !11)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 46, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 5)
!45 = !DILocation(line: 46, column: 16, scope: !44)
!46 = !DILocation(line: 46, column: 31, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !12, line: 48, type: !32)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 47, column: 9)
!49 = !DILocation(line: 48, column: 18, scope: !48)
!50 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 49, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 49, column: 20, scope: !48)
!55 = !DILocalVariable(name: "sourceLen", scope: !48, file: !12, line: 49, type: !51)
!56 = !DILocation(line: 49, column: 23, scope: !48)
!57 = !DILocation(line: 50, column: 32, scope: !48)
!58 = !DILocation(line: 50, column: 25, scope: !48)
!59 = !DILocation(line: 50, column: 23, scope: !48)
!60 = !DILocation(line: 53, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !48, file: !12, line: 53, column: 13)
!62 = !DILocation(line: 53, column: 18, scope: !61)
!63 = !DILocation(line: 53, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !12, line: 53, column: 13)
!65 = !DILocation(line: 53, column: 29, scope: !64)
!66 = !DILocation(line: 53, column: 39, scope: !64)
!67 = !DILocation(line: 53, column: 27, scope: !64)
!68 = !DILocation(line: 53, column: 13, scope: !61)
!69 = !DILocation(line: 55, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !64, file: !12, line: 54, column: 13)
!71 = !DILocation(line: 55, column: 27, scope: !70)
!72 = !DILocation(line: 55, column: 17, scope: !70)
!73 = !DILocation(line: 55, column: 22, scope: !70)
!74 = !DILocation(line: 55, column: 25, scope: !70)
!75 = !DILocation(line: 56, column: 13, scope: !70)
!76 = !DILocation(line: 53, column: 45, scope: !64)
!77 = !DILocation(line: 53, column: 13, scope: !64)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 56, column: 13, scope: !61)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 57, column: 23, scope: !48)
!82 = !DILocation(line: 57, column: 13, scope: !48)
!83 = !DILocation(line: 60, column: 1, scope: !11)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_34_good", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 97, column: 5, scope: !84)
!86 = !DILocation(line: 98, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !88, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90, !91}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !12, line: 109, type: !90)
!93 = !DILocation(line: 109, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !12, line: 109, type: !91)
!95 = !DILocation(line: 109, column: 27, scope: !87)
!96 = !DILocation(line: 112, column: 22, scope: !87)
!97 = !DILocation(line: 112, column: 12, scope: !87)
!98 = !DILocation(line: 112, column: 5, scope: !87)
!99 = !DILocation(line: 114, column: 5, scope: !87)
!100 = !DILocation(line: 115, column: 5, scope: !87)
!101 = !DILocation(line: 116, column: 5, scope: !87)
!102 = !DILocation(line: 119, column: 5, scope: !87)
!103 = !DILocation(line: 120, column: 5, scope: !87)
!104 = !DILocation(line: 121, column: 5, scope: !87)
!105 = !DILocation(line: 123, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 69, type: !16)
!108 = !DILocation(line: 69, column: 12, scope: !106)
!109 = !DILocalVariable(name: "myUnion", scope: !106, file: !12, line: 70, type: !20)
!110 = !DILocation(line: 70, column: 79, scope: !106)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !12, line: 71, type: !27)
!112 = !DILocation(line: 71, column: 10, scope: !106)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !12, line: 72, type: !32)
!114 = !DILocation(line: 72, column: 10, scope: !106)
!115 = !DILocation(line: 75, column: 12, scope: !106)
!116 = !DILocation(line: 75, column: 10, scope: !106)
!117 = !DILocation(line: 76, column: 5, scope: !106)
!118 = !DILocation(line: 76, column: 13, scope: !106)
!119 = !DILocation(line: 77, column: 26, scope: !106)
!120 = !DILocation(line: 77, column: 13, scope: !106)
!121 = !DILocation(line: 77, column: 24, scope: !106)
!122 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 79, type: !16)
!123 = distinct !DILexicalBlock(scope: !106, file: !12, line: 78, column: 5)
!124 = !DILocation(line: 79, column: 16, scope: !123)
!125 = !DILocation(line: 79, column: 31, scope: !123)
!126 = !DILocalVariable(name: "source", scope: !127, file: !12, line: 81, type: !32)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 80, column: 9)
!128 = !DILocation(line: 81, column: 18, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !12, line: 82, type: !51)
!130 = !DILocation(line: 82, column: 20, scope: !127)
!131 = !DILocalVariable(name: "sourceLen", scope: !127, file: !12, line: 82, type: !51)
!132 = !DILocation(line: 82, column: 23, scope: !127)
!133 = !DILocation(line: 83, column: 32, scope: !127)
!134 = !DILocation(line: 83, column: 25, scope: !127)
!135 = !DILocation(line: 83, column: 23, scope: !127)
!136 = !DILocation(line: 86, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !12, line: 86, column: 13)
!138 = !DILocation(line: 86, column: 18, scope: !137)
!139 = !DILocation(line: 86, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 86, column: 13)
!141 = !DILocation(line: 86, column: 29, scope: !140)
!142 = !DILocation(line: 86, column: 39, scope: !140)
!143 = !DILocation(line: 86, column: 27, scope: !140)
!144 = !DILocation(line: 86, column: 13, scope: !137)
!145 = !DILocation(line: 88, column: 34, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !12, line: 87, column: 13)
!147 = !DILocation(line: 88, column: 27, scope: !146)
!148 = !DILocation(line: 88, column: 17, scope: !146)
!149 = !DILocation(line: 88, column: 22, scope: !146)
!150 = !DILocation(line: 88, column: 25, scope: !146)
!151 = !DILocation(line: 89, column: 13, scope: !146)
!152 = !DILocation(line: 86, column: 45, scope: !140)
!153 = !DILocation(line: 86, column: 13, scope: !140)
!154 = distinct !{!154, !144, !155, !80}
!155 = !DILocation(line: 89, column: 13, scope: !137)
!156 = !DILocation(line: 90, column: 23, scope: !127)
!157 = !DILocation(line: 90, column: 13, scope: !127)
!158 = !DILocation(line: 93, column: 1, scope: !106)
