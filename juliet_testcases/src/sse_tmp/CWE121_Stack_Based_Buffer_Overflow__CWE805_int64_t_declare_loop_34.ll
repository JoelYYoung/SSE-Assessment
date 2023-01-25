; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType* %myUnion, metadata !23, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i64* %arraydecay, i64** %data, align 8, !dbg !41
  %0 = load i64*, i64** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType* %myUnion to i64**, !dbg !43
  store i64* %0, i64** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType* %myUnion to i64**, !dbg !48
  %1 = load i64*, i64** %unionSecond, align 8, !dbg !48
  store i64* %1, i64** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !61
  %cmp = icmp ult i64 %3, 100, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !67
  %5 = load i64, i64* %arrayidx, align 8, !dbg !67
  %6 = load i64*, i64** %data1, align 8, !dbg !68
  %7 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !68
  store i64 %5, i64* %arrayidx2, align 8, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %8, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data1, align 8, !dbg !77
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !77
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !77
  call void @printLongLongLine(i64 %10), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType* %myUnion, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i64* %arraydecay, i64** %data, align 8, !dbg !114
  %0 = load i64*, i64** %data, align 8, !dbg !115
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType* %myUnion to i64**, !dbg !116
  store i64* %0, i64** %unionFirst, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !118, metadata !DIExpression()), !dbg !120
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType* %myUnion to i64**, !dbg !121
  %1 = load i64*, i64** %unionSecond, align 8, !dbg !121
  store i64* %1, i64** %data1, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %3, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !137
  %5 = load i64, i64* %arrayidx, align 8, !dbg !137
  %6 = load i64*, i64** %data1, align 8, !dbg !138
  %7 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !138
  store i64 %5, i64* %arrayidx2, align 8, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %8, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data1, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !146
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !146
  call void @printLongLongLine(i64 %10), !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 29, column: 15, scope: !11)
!23 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_unionType", file: !12, line: 23, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 19, size: 64, elements: !26)
!26 = !{!27, !28}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !25, file: !12, line: 21, baseType: !16, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !25, file: !12, line: 22, baseType: !16, size: 64)
!29 = !DILocation(line: 30, column: 82, scope: !11)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 31, column: 13, scope: !11)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 32, column: 13, scope: !11)
!40 = !DILocation(line: 35, column: 12, scope: !11)
!41 = !DILocation(line: 35, column: 10, scope: !11)
!42 = !DILocation(line: 36, column: 26, scope: !11)
!43 = !DILocation(line: 36, column: 13, scope: !11)
!44 = !DILocation(line: 36, column: 24, scope: !11)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 38, type: !16)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 19, scope: !46)
!48 = !DILocation(line: 38, column: 34, scope: !46)
!49 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 40, type: !36)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 39, column: 9)
!51 = !DILocation(line: 40, column: 21, scope: !50)
!52 = !DILocalVariable(name: "i", scope: !53, file: !12, line: 42, type: !54)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 41, column: 13)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 42, column: 24, scope: !53)
!58 = !DILocation(line: 44, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !12, line: 44, column: 17)
!60 = !DILocation(line: 44, column: 22, scope: !59)
!61 = !DILocation(line: 44, column: 29, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 44, column: 17)
!63 = !DILocation(line: 44, column: 31, scope: !62)
!64 = !DILocation(line: 44, column: 17, scope: !59)
!65 = !DILocation(line: 46, column: 38, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !12, line: 45, column: 17)
!67 = !DILocation(line: 46, column: 31, scope: !66)
!68 = !DILocation(line: 46, column: 21, scope: !66)
!69 = !DILocation(line: 46, column: 26, scope: !66)
!70 = !DILocation(line: 46, column: 29, scope: !66)
!71 = !DILocation(line: 47, column: 17, scope: !66)
!72 = !DILocation(line: 44, column: 39, scope: !62)
!73 = !DILocation(line: 44, column: 17, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 47, column: 17, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 48, column: 35, scope: !53)
!78 = !DILocation(line: 48, column: 17, scope: !53)
!79 = !DILocation(line: 52, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_34_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 87, column: 5, scope: !80)
!82 = !DILocation(line: 88, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !84, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 99, type: !86)
!91 = !DILocation(line: 99, column: 14, scope: !83)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 99, type: !87)
!93 = !DILocation(line: 99, column: 27, scope: !83)
!94 = !DILocation(line: 102, column: 22, scope: !83)
!95 = !DILocation(line: 102, column: 12, scope: !83)
!96 = !DILocation(line: 102, column: 5, scope: !83)
!97 = !DILocation(line: 104, column: 5, scope: !83)
!98 = !DILocation(line: 105, column: 5, scope: !83)
!99 = !DILocation(line: 106, column: 5, scope: !83)
!100 = !DILocation(line: 109, column: 5, scope: !83)
!101 = !DILocation(line: 110, column: 5, scope: !83)
!102 = !DILocation(line: 111, column: 5, scope: !83)
!103 = !DILocation(line: 113, column: 5, scope: !83)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 61, type: !16)
!106 = !DILocation(line: 61, column: 15, scope: !104)
!107 = !DILocalVariable(name: "myUnion", scope: !104, file: !12, line: 62, type: !24)
!108 = !DILocation(line: 62, column: 82, scope: !104)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 63, type: !31)
!110 = !DILocation(line: 63, column: 13, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 64, type: !36)
!112 = !DILocation(line: 64, column: 13, scope: !104)
!113 = !DILocation(line: 66, column: 12, scope: !104)
!114 = !DILocation(line: 66, column: 10, scope: !104)
!115 = !DILocation(line: 67, column: 26, scope: !104)
!116 = !DILocation(line: 67, column: 13, scope: !104)
!117 = !DILocation(line: 67, column: 24, scope: !104)
!118 = !DILocalVariable(name: "data", scope: !119, file: !12, line: 69, type: !16)
!119 = distinct !DILexicalBlock(scope: !104, file: !12, line: 68, column: 5)
!120 = !DILocation(line: 69, column: 19, scope: !119)
!121 = !DILocation(line: 69, column: 34, scope: !119)
!122 = !DILocalVariable(name: "source", scope: !123, file: !12, line: 71, type: !36)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 70, column: 9)
!124 = !DILocation(line: 71, column: 21, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 73, type: !54)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 72, column: 13)
!127 = !DILocation(line: 73, column: 24, scope: !126)
!128 = !DILocation(line: 75, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 75, column: 17)
!130 = !DILocation(line: 75, column: 22, scope: !129)
!131 = !DILocation(line: 75, column: 29, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 75, column: 17)
!133 = !DILocation(line: 75, column: 31, scope: !132)
!134 = !DILocation(line: 75, column: 17, scope: !129)
!135 = !DILocation(line: 77, column: 38, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 76, column: 17)
!137 = !DILocation(line: 77, column: 31, scope: !136)
!138 = !DILocation(line: 77, column: 21, scope: !136)
!139 = !DILocation(line: 77, column: 26, scope: !136)
!140 = !DILocation(line: 77, column: 29, scope: !136)
!141 = !DILocation(line: 78, column: 17, scope: !136)
!142 = !DILocation(line: 75, column: 39, scope: !132)
!143 = !DILocation(line: 75, column: 17, scope: !132)
!144 = distinct !{!144, !134, !145, !76}
!145 = !DILocation(line: 78, column: 17, scope: !129)
!146 = !DILocation(line: 79, column: 35, scope: !126)
!147 = !DILocation(line: 79, column: 17, scope: !126)
!148 = !DILocation(line: 83, column: 1, scope: !104)
