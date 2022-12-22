; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !32
  %0 = bitcast i8* %call to i64*, !dbg !33
  store i64* %0, i64** %data, align 8, !dbg !34
  %1 = load i64*, i64** %data, align 8, !dbg !35
  %cmp = icmp eq i64* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType* %myUnion to i64**, !dbg !42
  store i64* %2, i64** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType* %myUnion to i64**, !dbg !47
  %3 = load i64*, i64** %unionSecond, align 8, !dbg !47
  store i64* %3, i64** %data1, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !63
  %cmp2 = icmp ult i64 %5, 100, !dbg !65
  br i1 %cmp2, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %6, !dbg !69
  %7 = load i64, i64* %arrayidx, align 8, !dbg !69
  %8 = load i64*, i64** %data1, align 8, !dbg !70
  %9 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 %9, !dbg !70
  store i64 %7, i64* %arrayidx3, align 8, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %10, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %11 = load i64*, i64** %data1, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds i64, i64* %11, i64 0, !dbg !79
  %12 = load i64, i64* %arrayidx4, align 8, !dbg !79
  call void @printLongLongLine(i64 %12), !dbg !80
  %13 = load i64*, i64** %data1, align 8, !dbg !81
  %14 = bitcast i64* %13 to i8*, !dbg !81
  call void @free(i8* %14) #6, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_good() #0 !dbg !84 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #6, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #6, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType* %myUnion, metadata !111, metadata !DIExpression()), !dbg !112
  store i64* null, i64** %data, align 8, !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !114
  %0 = bitcast i8* %call to i64*, !dbg !115
  store i64* %0, i64** %data, align 8, !dbg !116
  %1 = load i64*, i64** %data, align 8, !dbg !117
  %cmp = icmp eq i64* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !123
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType* %myUnion to i64**, !dbg !124
  store i64* %2, i64** %unionFirst, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !126, metadata !DIExpression()), !dbg !128
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType* %myUnion to i64**, !dbg !129
  %3 = load i64*, i64** %unionSecond, align 8, !dbg !129
  store i64* %3, i64** %data1, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !139
  %cmp2 = icmp ult i64 %5, 100, !dbg !141
  br i1 %cmp2, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %6, !dbg !145
  %7 = load i64, i64* %arrayidx, align 8, !dbg !145
  %8 = load i64*, i64** %data1, align 8, !dbg !146
  %9 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 %9, !dbg !146
  store i64 %7, i64* %arrayidx3, align 8, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %10, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %11 = load i64*, i64** %data1, align 8, !dbg !154
  %arrayidx4 = getelementptr inbounds i64, i64* %11, i64 0, !dbg !154
  %12 = load i64, i64* %arrayidx4, align 8, !dbg !154
  call void @printLongLongLine(i64 %12), !dbg !155
  %13 = load i64*, i64** %data1, align 8, !dbg !156
  %14 = bitcast i64* %13 to i8*, !dbg !156
  call void @free(i8* %14) #6, !dbg !157
  ret void, !dbg !158
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 15, scope: !18)
!24 = !DILocalVariable(name: "myUnion", scope: !18, file: !19, line: 30, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_unionType", file: !19, line: 23, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !19, line: 19, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !19, line: 21, baseType: !4, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !19, line: 22, baseType: !4, size: 64)
!30 = !DILocation(line: 30, column: 75, scope: !18)
!31 = !DILocation(line: 31, column: 10, scope: !18)
!32 = !DILocation(line: 33, column: 23, scope: !18)
!33 = !DILocation(line: 33, column: 12, scope: !18)
!34 = !DILocation(line: 33, column: 10, scope: !18)
!35 = !DILocation(line: 34, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 9)
!37 = !DILocation(line: 34, column: 14, scope: !36)
!38 = !DILocation(line: 34, column: 9, scope: !18)
!39 = !DILocation(line: 34, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 34, column: 23)
!41 = !DILocation(line: 35, column: 26, scope: !18)
!42 = !DILocation(line: 35, column: 13, scope: !18)
!43 = !DILocation(line: 35, column: 24, scope: !18)
!44 = !DILocalVariable(name: "data", scope: !45, file: !19, line: 37, type: !4)
!45 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 5)
!46 = !DILocation(line: 37, column: 19, scope: !45)
!47 = !DILocation(line: 37, column: 34, scope: !45)
!48 = !DILocalVariable(name: "source", scope: !49, file: !19, line: 39, type: !50)
!49 = distinct !DILexicalBlock(scope: !45, file: !19, line: 38, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 39, column: 21, scope: !49)
!54 = !DILocalVariable(name: "i", scope: !55, file: !19, line: 41, type: !56)
!55 = distinct !DILexicalBlock(scope: !49, file: !19, line: 40, column: 13)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 46, baseType: !58)
!57 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 41, column: 24, scope: !55)
!60 = !DILocation(line: 43, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !19, line: 43, column: 17)
!62 = !DILocation(line: 43, column: 22, scope: !61)
!63 = !DILocation(line: 43, column: 29, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !19, line: 43, column: 17)
!65 = !DILocation(line: 43, column: 31, scope: !64)
!66 = !DILocation(line: 43, column: 17, scope: !61)
!67 = !DILocation(line: 45, column: 38, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !19, line: 44, column: 17)
!69 = !DILocation(line: 45, column: 31, scope: !68)
!70 = !DILocation(line: 45, column: 21, scope: !68)
!71 = !DILocation(line: 45, column: 26, scope: !68)
!72 = !DILocation(line: 45, column: 29, scope: !68)
!73 = !DILocation(line: 46, column: 17, scope: !68)
!74 = !DILocation(line: 43, column: 39, scope: !64)
!75 = !DILocation(line: 43, column: 17, scope: !64)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 46, column: 17, scope: !61)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 47, column: 35, scope: !55)
!80 = !DILocation(line: 47, column: 17, scope: !55)
!81 = !DILocation(line: 48, column: 22, scope: !55)
!82 = !DILocation(line: 48, column: 17, scope: !55)
!83 = !DILocation(line: 52, column: 1, scope: !18)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_34_good", scope: !19, file: !19, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 88, column: 5, scope: !84)
!86 = !DILocation(line: 89, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 100, type: !88, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90, !91}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !19, line: 100, type: !90)
!95 = !DILocation(line: 100, column: 14, scope: !87)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !19, line: 100, type: !91)
!97 = !DILocation(line: 100, column: 27, scope: !87)
!98 = !DILocation(line: 103, column: 22, scope: !87)
!99 = !DILocation(line: 103, column: 12, scope: !87)
!100 = !DILocation(line: 103, column: 5, scope: !87)
!101 = !DILocation(line: 105, column: 5, scope: !87)
!102 = !DILocation(line: 106, column: 5, scope: !87)
!103 = !DILocation(line: 107, column: 5, scope: !87)
!104 = !DILocation(line: 110, column: 5, scope: !87)
!105 = !DILocation(line: 111, column: 5, scope: !87)
!106 = !DILocation(line: 112, column: 5, scope: !87)
!107 = !DILocation(line: 114, column: 5, scope: !87)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !19, line: 61, type: !4)
!110 = !DILocation(line: 61, column: 15, scope: !108)
!111 = !DILocalVariable(name: "myUnion", scope: !108, file: !19, line: 62, type: !25)
!112 = !DILocation(line: 62, column: 75, scope: !108)
!113 = !DILocation(line: 63, column: 10, scope: !108)
!114 = !DILocation(line: 65, column: 23, scope: !108)
!115 = !DILocation(line: 65, column: 12, scope: !108)
!116 = !DILocation(line: 65, column: 10, scope: !108)
!117 = !DILocation(line: 66, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !19, line: 66, column: 9)
!119 = !DILocation(line: 66, column: 14, scope: !118)
!120 = !DILocation(line: 66, column: 9, scope: !108)
!121 = !DILocation(line: 66, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !19, line: 66, column: 23)
!123 = !DILocation(line: 67, column: 26, scope: !108)
!124 = !DILocation(line: 67, column: 13, scope: !108)
!125 = !DILocation(line: 67, column: 24, scope: !108)
!126 = !DILocalVariable(name: "data", scope: !127, file: !19, line: 69, type: !4)
!127 = distinct !DILexicalBlock(scope: !108, file: !19, line: 68, column: 5)
!128 = !DILocation(line: 69, column: 19, scope: !127)
!129 = !DILocation(line: 69, column: 34, scope: !127)
!130 = !DILocalVariable(name: "source", scope: !131, file: !19, line: 71, type: !50)
!131 = distinct !DILexicalBlock(scope: !127, file: !19, line: 70, column: 9)
!132 = !DILocation(line: 71, column: 21, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !19, line: 73, type: !56)
!134 = distinct !DILexicalBlock(scope: !131, file: !19, line: 72, column: 13)
!135 = !DILocation(line: 73, column: 24, scope: !134)
!136 = !DILocation(line: 75, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !19, line: 75, column: 17)
!138 = !DILocation(line: 75, column: 22, scope: !137)
!139 = !DILocation(line: 75, column: 29, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !19, line: 75, column: 17)
!141 = !DILocation(line: 75, column: 31, scope: !140)
!142 = !DILocation(line: 75, column: 17, scope: !137)
!143 = !DILocation(line: 77, column: 38, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !19, line: 76, column: 17)
!145 = !DILocation(line: 77, column: 31, scope: !144)
!146 = !DILocation(line: 77, column: 21, scope: !144)
!147 = !DILocation(line: 77, column: 26, scope: !144)
!148 = !DILocation(line: 77, column: 29, scope: !144)
!149 = !DILocation(line: 78, column: 17, scope: !144)
!150 = !DILocation(line: 75, column: 39, scope: !140)
!151 = !DILocation(line: 75, column: 17, scope: !140)
!152 = distinct !{!152, !142, !153, !78}
!153 = !DILocation(line: 78, column: 17, scope: !137)
!154 = !DILocation(line: 79, column: 35, scope: !134)
!155 = !DILocation(line: 79, column: 17, scope: !134)
!156 = !DILocation(line: 80, column: 22, scope: !134)
!157 = !DILocation(line: 80, column: 17, scope: !134)
!158 = !DILocation(line: 84, column: 1, scope: !108)
