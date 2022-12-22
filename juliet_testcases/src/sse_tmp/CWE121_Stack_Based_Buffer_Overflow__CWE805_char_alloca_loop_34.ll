; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 50, align 16, !dbg !28
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 100, align 16, !dbg !31
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !30
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  store i8* %2, i8** %data, align 8, !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !37
  store i8* %4, i8** %unionFirst, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !42
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !42
  store i8* %5, i8** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !49, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx2, align 1, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %6, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !66
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !66
  %9 = load i8*, i8** %data1, align 8, !dbg !67
  %10 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !67
  store i8 %8, i8* %arrayidx4, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %11, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !76
  store i8 0, i8* %arrayidx5, align 1, !dbg !77
  %13 = load i8*, i8** %data1, align 8, !dbg !78
  call void @printLine(i8* %13), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #5, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #5, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 50, align 16, !dbg !110
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %1 = alloca i8, i64 100, align 16, !dbg !113
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !112
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !114
  store i8* %2, i8** %data, align 8, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !119
  store i8* %4, i8** %unionFirst, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !121, metadata !DIExpression()), !dbg !123
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !124
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !124
  store i8* %5, i8** %data1, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx2, align 1, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !136
  %cmp = icmp ult i64 %6, 100, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !142
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !142
  %9 = load i8*, i8** %data1, align 8, !dbg !143
  %10 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !143
  store i8 %8, i8* %arrayidx4, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %11, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !151
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !151
  store i8 0, i8* %arrayidx5, align 1, !dbg !152
  %13 = load i8*, i8** %data1, align 8, !dbg !153
  call void @printLine(i8* %13), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType", file: !14, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 23, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 24, baseType: !4, size: 64)
!25 = !DILocation(line: 32, column: 78, scope: !13)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !4)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 36, scope: !13)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !4)
!30 = !DILocation(line: 34, column: 12, scope: !13)
!31 = !DILocation(line: 34, column: 37, scope: !13)
!32 = !DILocation(line: 37, column: 12, scope: !13)
!33 = !DILocation(line: 37, column: 10, scope: !13)
!34 = !DILocation(line: 38, column: 5, scope: !13)
!35 = !DILocation(line: 38, column: 13, scope: !13)
!36 = !DILocation(line: 39, column: 26, scope: !13)
!37 = !DILocation(line: 39, column: 13, scope: !13)
!38 = !DILocation(line: 39, column: 24, scope: !13)
!39 = !DILocalVariable(name: "data", scope: !40, file: !14, line: 41, type: !4)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!41 = !DILocation(line: 41, column: 16, scope: !40)
!42 = !DILocation(line: 41, column: 31, scope: !40)
!43 = !DILocalVariable(name: "i", scope: !44, file: !14, line: 43, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !14, line: 42, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 43, column: 20, scope: !44)
!49 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 44, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 44, column: 18, scope: !44)
!54 = !DILocation(line: 45, column: 13, scope: !44)
!55 = !DILocation(line: 46, column: 13, scope: !44)
!56 = !DILocation(line: 46, column: 27, scope: !44)
!57 = !DILocation(line: 48, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !14, line: 48, column: 13)
!59 = !DILocation(line: 48, column: 18, scope: !58)
!60 = !DILocation(line: 48, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !14, line: 48, column: 13)
!62 = !DILocation(line: 48, column: 27, scope: !61)
!63 = !DILocation(line: 48, column: 13, scope: !58)
!64 = !DILocation(line: 50, column: 34, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !14, line: 49, column: 13)
!66 = !DILocation(line: 50, column: 27, scope: !65)
!67 = !DILocation(line: 50, column: 17, scope: !65)
!68 = !DILocation(line: 50, column: 22, scope: !65)
!69 = !DILocation(line: 50, column: 25, scope: !65)
!70 = !DILocation(line: 51, column: 13, scope: !65)
!71 = !DILocation(line: 48, column: 35, scope: !61)
!72 = !DILocation(line: 48, column: 13, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 51, column: 13, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 52, column: 13, scope: !44)
!77 = !DILocation(line: 52, column: 25, scope: !44)
!78 = !DILocation(line: 53, column: 23, scope: !44)
!79 = !DILocation(line: 53, column: 13, scope: !44)
!80 = !DILocation(line: 56, column: 1, scope: !13)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_good", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 93, column: 5, scope: !81)
!83 = !DILocation(line: 94, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 105, type: !85, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !14, line: 105, type: !87)
!90 = !DILocation(line: 105, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !14, line: 105, type: !88)
!92 = !DILocation(line: 105, column: 27, scope: !84)
!93 = !DILocation(line: 108, column: 22, scope: !84)
!94 = !DILocation(line: 108, column: 12, scope: !84)
!95 = !DILocation(line: 108, column: 5, scope: !84)
!96 = !DILocation(line: 110, column: 5, scope: !84)
!97 = !DILocation(line: 111, column: 5, scope: !84)
!98 = !DILocation(line: 112, column: 5, scope: !84)
!99 = !DILocation(line: 115, column: 5, scope: !84)
!100 = !DILocation(line: 116, column: 5, scope: !84)
!101 = !DILocation(line: 117, column: 5, scope: !84)
!102 = !DILocation(line: 119, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 63, type: !15, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 65, type: !4)
!105 = !DILocation(line: 65, column: 12, scope: !103)
!106 = !DILocalVariable(name: "myUnion", scope: !103, file: !14, line: 66, type: !20)
!107 = !DILocation(line: 66, column: 78, scope: !103)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !14, line: 67, type: !4)
!109 = !DILocation(line: 67, column: 12, scope: !103)
!110 = !DILocation(line: 67, column: 36, scope: !103)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !14, line: 68, type: !4)
!112 = !DILocation(line: 68, column: 12, scope: !103)
!113 = !DILocation(line: 68, column: 37, scope: !103)
!114 = !DILocation(line: 70, column: 12, scope: !103)
!115 = !DILocation(line: 70, column: 10, scope: !103)
!116 = !DILocation(line: 71, column: 5, scope: !103)
!117 = !DILocation(line: 71, column: 13, scope: !103)
!118 = !DILocation(line: 72, column: 26, scope: !103)
!119 = !DILocation(line: 72, column: 13, scope: !103)
!120 = !DILocation(line: 72, column: 24, scope: !103)
!121 = !DILocalVariable(name: "data", scope: !122, file: !14, line: 74, type: !4)
!122 = distinct !DILexicalBlock(scope: !103, file: !14, line: 73, column: 5)
!123 = !DILocation(line: 74, column: 16, scope: !122)
!124 = !DILocation(line: 74, column: 31, scope: !122)
!125 = !DILocalVariable(name: "i", scope: !126, file: !14, line: 76, type: !45)
!126 = distinct !DILexicalBlock(scope: !122, file: !14, line: 75, column: 9)
!127 = !DILocation(line: 76, column: 20, scope: !126)
!128 = !DILocalVariable(name: "source", scope: !126, file: !14, line: 77, type: !50)
!129 = !DILocation(line: 77, column: 18, scope: !126)
!130 = !DILocation(line: 78, column: 13, scope: !126)
!131 = !DILocation(line: 79, column: 13, scope: !126)
!132 = !DILocation(line: 79, column: 27, scope: !126)
!133 = !DILocation(line: 81, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !126, file: !14, line: 81, column: 13)
!135 = !DILocation(line: 81, column: 18, scope: !134)
!136 = !DILocation(line: 81, column: 25, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !14, line: 81, column: 13)
!138 = !DILocation(line: 81, column: 27, scope: !137)
!139 = !DILocation(line: 81, column: 13, scope: !134)
!140 = !DILocation(line: 83, column: 34, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !14, line: 82, column: 13)
!142 = !DILocation(line: 83, column: 27, scope: !141)
!143 = !DILocation(line: 83, column: 17, scope: !141)
!144 = !DILocation(line: 83, column: 22, scope: !141)
!145 = !DILocation(line: 83, column: 25, scope: !141)
!146 = !DILocation(line: 84, column: 13, scope: !141)
!147 = !DILocation(line: 81, column: 35, scope: !137)
!148 = !DILocation(line: 81, column: 13, scope: !137)
!149 = distinct !{!149, !139, !150, !75}
!150 = !DILocation(line: 84, column: 13, scope: !134)
!151 = !DILocation(line: 85, column: 13, scope: !126)
!152 = !DILocation(line: 85, column: 25, scope: !126)
!153 = !DILocation(line: 86, column: 23, scope: !126)
!154 = !DILocation(line: 86, column: 13, scope: !126)
!155 = !DILocation(line: 89, column: 1, scope: !103)
