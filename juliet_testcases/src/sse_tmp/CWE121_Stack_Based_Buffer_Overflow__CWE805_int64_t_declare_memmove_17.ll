; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp slt i32 %0, 1, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i64* %arraydecay, i64** %data, align 8, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %1, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !54
  %3 = load i64*, i64** %data, align 8, !dbg !55
  %4 = bitcast i64* %3 to i8*, !dbg !56
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !56
  %5 = bitcast i64* %arraydecay1 to i8*, !dbg !56
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !56
  %6 = load i64*, i64** %data, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !57
  %7 = load i64, i64* %arrayidx, align 8, !dbg !57
  call void @printLongLongLine(i64 %7), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i64** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 0, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !95
  %cmp = icmp slt i32 %0, 1, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i64* %arraydecay, i64** %data, align 8, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !103
  %inc = add nsw i32 %1, 1, !dbg !103
  store i32 %inc, i32* %h, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !109
  %3 = load i64*, i64** %data, align 8, !dbg !110
  %4 = bitcast i64* %3 to i8*, !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !111
  %5 = bitcast i64* %arraydecay1 to i8*, !dbg !111
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !111
  %6 = load i64*, i64** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !112
  %7 = load i64, i64* %arrayidx, align 8, !dbg !112
  call void @printLongLongLine(i64 %7), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 23, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !21, line: 27, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !23, line: 44, baseType: !24)
!23 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!24 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!25 = !DILocation(line: 24, column: 15, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 25, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 25, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 26, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 26, column: 13, scope: !11)
!36 = !DILocation(line: 27, column: 11, scope: !37)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!38 = !DILocation(line: 27, column: 9, scope: !37)
!39 = !DILocation(line: 27, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 27, column: 5)
!41 = !DILocation(line: 27, column: 18, scope: !40)
!42 = !DILocation(line: 27, column: 5, scope: !37)
!43 = !DILocation(line: 31, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 28, column: 5)
!45 = !DILocation(line: 31, column: 14, scope: !44)
!46 = !DILocation(line: 32, column: 5, scope: !44)
!47 = !DILocation(line: 27, column: 24, scope: !40)
!48 = !DILocation(line: 27, column: 5, scope: !40)
!49 = distinct !{!49, !42, !50, !51}
!50 = !DILocation(line: 32, column: 5, scope: !37)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 34, type: !32)
!53 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!54 = !DILocation(line: 34, column: 17, scope: !53)
!55 = !DILocation(line: 36, column: 17, scope: !53)
!56 = !DILocation(line: 36, column: 9, scope: !53)
!57 = !DILocation(line: 37, column: 27, scope: !53)
!58 = !DILocation(line: 37, column: 9, scope: !53)
!59 = !DILocation(line: 39, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_17_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 67, column: 5, scope: !60)
!62 = !DILocation(line: 68, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 80, type: !64, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!16, !16, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 80, type: !16)
!70 = !DILocation(line: 80, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 80, type: !66)
!72 = !DILocation(line: 80, column: 27, scope: !63)
!73 = !DILocation(line: 83, column: 22, scope: !63)
!74 = !DILocation(line: 83, column: 12, scope: !63)
!75 = !DILocation(line: 83, column: 5, scope: !63)
!76 = !DILocation(line: 85, column: 5, scope: !63)
!77 = !DILocation(line: 86, column: 5, scope: !63)
!78 = !DILocation(line: 87, column: 5, scope: !63)
!79 = !DILocation(line: 90, column: 5, scope: !63)
!80 = !DILocation(line: 91, column: 5, scope: !63)
!81 = !DILocation(line: 92, column: 5, scope: !63)
!82 = !DILocation(line: 94, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "h", scope: !83, file: !12, line: 48, type: !16)
!85 = !DILocation(line: 48, column: 9, scope: !83)
!86 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 49, type: !19)
!87 = !DILocation(line: 49, column: 15, scope: !83)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 50, type: !27)
!89 = !DILocation(line: 50, column: 13, scope: !83)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 51, type: !32)
!91 = !DILocation(line: 51, column: 13, scope: !83)
!92 = !DILocation(line: 52, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !12, line: 52, column: 5)
!94 = !DILocation(line: 52, column: 9, scope: !93)
!95 = !DILocation(line: 52, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 52, column: 5)
!97 = !DILocation(line: 52, column: 18, scope: !96)
!98 = !DILocation(line: 52, column: 5, scope: !93)
!99 = !DILocation(line: 55, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 53, column: 5)
!101 = !DILocation(line: 55, column: 14, scope: !100)
!102 = !DILocation(line: 56, column: 5, scope: !100)
!103 = !DILocation(line: 52, column: 24, scope: !96)
!104 = !DILocation(line: 52, column: 5, scope: !96)
!105 = distinct !{!105, !98, !106, !51}
!106 = !DILocation(line: 56, column: 5, scope: !93)
!107 = !DILocalVariable(name: "source", scope: !108, file: !12, line: 58, type: !32)
!108 = distinct !DILexicalBlock(scope: !83, file: !12, line: 57, column: 5)
!109 = !DILocation(line: 58, column: 17, scope: !108)
!110 = !DILocation(line: 60, column: 17, scope: !108)
!111 = !DILocation(line: 60, column: 9, scope: !108)
!112 = !DILocation(line: 61, column: 27, scope: !108)
!113 = !DILocation(line: 61, column: 9, scope: !108)
!114 = !DILocation(line: 63, column: 1, scope: !83)
