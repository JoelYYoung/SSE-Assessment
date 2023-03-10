; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  %0 = load i64*, i64** %data, align 8, !dbg !24
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61b_badSource(i64* %0), !dbg !25
  store i64* %call, i64** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !27, metadata !DIExpression()), !dbg !32
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %2, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !48
  %4 = load i64, i64* %arrayidx, align 8, !dbg !48
  %5 = load i64*, i64** %data, align 8, !dbg !49
  %6 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !49
  store i64 %4, i64* %arrayidx1, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %7, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !58
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !58
  call void @printLongLongLine(i64 %9), !dbg !59
  %10 = load i64*, i64** %data, align 8, !dbg !60
  %11 = bitcast i64* %10 to i8*, !dbg !60
  call void @free(i8* %11) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61b_badSource(i64*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i64* null, i64** %data, align 8, !dbg !90
  %0 = load i64*, i64** %data, align 8, !dbg !91
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61b_goodG2BSource(i64* %0), !dbg !92
  store i64* %call, i64** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !96
  call void @llvm.dbg.declare(metadata i64* %i, metadata !97, metadata !DIExpression()), !dbg !99
  store i64 0, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !103
  %cmp = icmp ult i64 %2, 100, !dbg !105
  br i1 %cmp, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !109
  %4 = load i64, i64* %arrayidx, align 8, !dbg !109
  %5 = load i64*, i64** %data, align 8, !dbg !110
  %6 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !110
  store i64 %4, i64* %arrayidx1, align 8, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !114
  %inc = add i64 %7, 1, !dbg !114
  store i64 %inc, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !118
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !118
  call void @printLongLongLine(i64 %9), !dbg !119
  %10 = load i64*, i64** %data, align 8, !dbg !120
  %11 = bitcast i64* %10 to i8*, !dbg !120
  call void @free(i8* %11) #5, !dbg !121
  ret void, !dbg !122
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61b_goodG2BSource(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61_bad", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 26, column: 15, scope: !11)
!23 = !DILocation(line: 27, column: 10, scope: !11)
!24 = !DILocation(line: 28, column: 83, scope: !11)
!25 = !DILocation(line: 28, column: 12, scope: !11)
!26 = !DILocation(line: 28, column: 10, scope: !11)
!27 = !DILocalVariable(name: "source", scope: !28, file: !12, line: 30, type: !29)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 30, column: 17, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 32, type: !35)
!34 = distinct !DILexicalBlock(scope: !28, file: !12, line: 31, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 32, column: 20, scope: !34)
!39 = !DILocation(line: 34, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 13)
!41 = !DILocation(line: 34, column: 18, scope: !40)
!42 = !DILocation(line: 34, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 34, column: 13)
!44 = !DILocation(line: 34, column: 27, scope: !43)
!45 = !DILocation(line: 34, column: 13, scope: !40)
!46 = !DILocation(line: 36, column: 34, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 35, column: 13)
!48 = !DILocation(line: 36, column: 27, scope: !47)
!49 = !DILocation(line: 36, column: 17, scope: !47)
!50 = !DILocation(line: 36, column: 22, scope: !47)
!51 = !DILocation(line: 36, column: 25, scope: !47)
!52 = !DILocation(line: 37, column: 13, scope: !47)
!53 = !DILocation(line: 34, column: 35, scope: !43)
!54 = !DILocation(line: 34, column: 13, scope: !43)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 37, column: 13, scope: !40)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 38, column: 31, scope: !34)
!59 = !DILocation(line: 38, column: 13, scope: !34)
!60 = !DILocation(line: 39, column: 18, scope: !34)
!61 = !DILocation(line: 39, column: 13, scope: !34)
!62 = !DILocation(line: 42, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_61_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 73, column: 5, scope: !63)
!65 = !DILocation(line: 74, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !67, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 86, type: !69)
!74 = !DILocation(line: 86, column: 14, scope: !66)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 86, type: !70)
!76 = !DILocation(line: 86, column: 27, scope: !66)
!77 = !DILocation(line: 89, column: 22, scope: !66)
!78 = !DILocation(line: 89, column: 12, scope: !66)
!79 = !DILocation(line: 89, column: 5, scope: !66)
!80 = !DILocation(line: 91, column: 5, scope: !66)
!81 = !DILocation(line: 92, column: 5, scope: !66)
!82 = !DILocation(line: 93, column: 5, scope: !66)
!83 = !DILocation(line: 96, column: 5, scope: !66)
!84 = !DILocation(line: 97, column: 5, scope: !66)
!85 = !DILocation(line: 98, column: 5, scope: !66)
!86 = !DILocation(line: 100, column: 5, scope: !66)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 53, type: !16)
!89 = !DILocation(line: 53, column: 15, scope: !87)
!90 = !DILocation(line: 54, column: 10, scope: !87)
!91 = !DILocation(line: 55, column: 87, scope: !87)
!92 = !DILocation(line: 55, column: 12, scope: !87)
!93 = !DILocation(line: 55, column: 10, scope: !87)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 57, type: !29)
!95 = distinct !DILexicalBlock(scope: !87, file: !12, line: 56, column: 5)
!96 = !DILocation(line: 57, column: 17, scope: !95)
!97 = !DILocalVariable(name: "i", scope: !98, file: !12, line: 59, type: !35)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 58, column: 9)
!99 = !DILocation(line: 59, column: 20, scope: !98)
!100 = !DILocation(line: 61, column: 20, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !12, line: 61, column: 13)
!102 = !DILocation(line: 61, column: 18, scope: !101)
!103 = !DILocation(line: 61, column: 25, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 61, column: 13)
!105 = !DILocation(line: 61, column: 27, scope: !104)
!106 = !DILocation(line: 61, column: 13, scope: !101)
!107 = !DILocation(line: 63, column: 34, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !12, line: 62, column: 13)
!109 = !DILocation(line: 63, column: 27, scope: !108)
!110 = !DILocation(line: 63, column: 17, scope: !108)
!111 = !DILocation(line: 63, column: 22, scope: !108)
!112 = !DILocation(line: 63, column: 25, scope: !108)
!113 = !DILocation(line: 64, column: 13, scope: !108)
!114 = !DILocation(line: 61, column: 35, scope: !104)
!115 = !DILocation(line: 61, column: 13, scope: !104)
!116 = distinct !{!116, !106, !117, !57}
!117 = !DILocation(line: 64, column: 13, scope: !101)
!118 = !DILocation(line: 65, column: 31, scope: !98)
!119 = !DILocation(line: 65, column: 13, scope: !98)
!120 = !DILocation(line: 66, column: 18, scope: !98)
!121 = !DILocation(line: 66, column: 13, scope: !98)
!122 = !DILocation(line: 69, column: 1, scope: !87)
