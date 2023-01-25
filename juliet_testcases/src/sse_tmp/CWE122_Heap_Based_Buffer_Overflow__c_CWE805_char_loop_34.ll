; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion to i8**, !dbg !39
  store i8* %2, i8** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion to i8**, !dbg !44
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !44
  store i8* %3, i8** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx2, align 1, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !62
  %cmp3 = icmp ult i64 %4, 100, !dbg !64
  br i1 %cmp3, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !68
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !68
  %7 = load i8*, i8** %data1, align 8, !dbg !69
  %8 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !69
  store i8 %6, i8* %arrayidx5, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %9, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !78
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !78
  store i8 0, i8* %arrayidx6, align 1, !dbg !79
  %11 = load i8*, i8** %data1, align 8, !dbg !80
  call void @printLine(i8* %11), !dbg !81
  %12 = load i8*, i8** %data1, align 8, !dbg !82
  call void @free(i8* %12) #6, !dbg !83
  ret void, !dbg !84
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

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #6, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #6, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion, metadata !110, metadata !DIExpression()), !dbg !111
  store i8* null, i8** %data, align 8, !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !113
  store i8* %call, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %cmp = icmp eq i8* %0, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  %2 = load i8*, i8** %data, align 8, !dbg !123
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion to i8**, !dbg !124
  store i8* %2, i8** %unionFirst, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !126, metadata !DIExpression()), !dbg !128
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion to i8**, !dbg !129
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !129
  store i8* %3, i8** %data1, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !135
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx2, align 1, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !141
  %cmp3 = icmp ult i64 %4, 100, !dbg !143
  br i1 %cmp3, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !147
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !147
  %7 = load i8*, i8** %data1, align 8, !dbg !148
  %8 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !148
  store i8 %6, i8* %arrayidx5, align 1, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %9, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !156
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !156
  store i8 0, i8* %arrayidx6, align 1, !dbg !157
  %11 = load i8*, i8** %data1, align 8, !dbg !158
  call void @printLine(i8* %11), !dbg !159
  %12 = load i8*, i8** %data1, align 8, !dbg !160
  call void @free(i8* %12) #6, !dbg !161
  ret void, !dbg !162
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 72, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocation(line: 35, column: 20, scope: !14)
!29 = !DILocation(line: 35, column: 10, scope: !14)
!30 = !DILocation(line: 36, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 9)
!32 = !DILocation(line: 36, column: 14, scope: !31)
!33 = !DILocation(line: 36, column: 9, scope: !14)
!34 = !DILocation(line: 36, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 36, column: 23)
!36 = !DILocation(line: 37, column: 5, scope: !14)
!37 = !DILocation(line: 37, column: 13, scope: !14)
!38 = !DILocation(line: 38, column: 26, scope: !14)
!39 = !DILocation(line: 38, column: 13, scope: !14)
!40 = !DILocation(line: 38, column: 24, scope: !14)
!41 = !DILocalVariable(name: "data", scope: !42, file: !15, line: 40, type: !4)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!43 = !DILocation(line: 40, column: 16, scope: !42)
!44 = !DILocation(line: 40, column: 31, scope: !42)
!45 = !DILocalVariable(name: "i", scope: !46, file: !15, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 41, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 42, column: 20, scope: !46)
!51 = !DILocalVariable(name: "source", scope: !46, file: !15, line: 43, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 43, column: 18, scope: !46)
!56 = !DILocation(line: 44, column: 13, scope: !46)
!57 = !DILocation(line: 45, column: 13, scope: !46)
!58 = !DILocation(line: 45, column: 27, scope: !46)
!59 = !DILocation(line: 47, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !46, file: !15, line: 47, column: 13)
!61 = !DILocation(line: 47, column: 18, scope: !60)
!62 = !DILocation(line: 47, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 47, column: 13)
!64 = !DILocation(line: 47, column: 27, scope: !63)
!65 = !DILocation(line: 47, column: 13, scope: !60)
!66 = !DILocation(line: 49, column: 34, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 48, column: 13)
!68 = !DILocation(line: 49, column: 27, scope: !67)
!69 = !DILocation(line: 49, column: 17, scope: !67)
!70 = !DILocation(line: 49, column: 22, scope: !67)
!71 = !DILocation(line: 49, column: 25, scope: !67)
!72 = !DILocation(line: 50, column: 13, scope: !67)
!73 = !DILocation(line: 47, column: 35, scope: !63)
!74 = !DILocation(line: 47, column: 13, scope: !63)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 50, column: 13, scope: !60)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 51, column: 13, scope: !46)
!79 = !DILocation(line: 51, column: 25, scope: !46)
!80 = !DILocation(line: 52, column: 23, scope: !46)
!81 = !DILocation(line: 52, column: 13, scope: !46)
!82 = !DILocation(line: 53, column: 18, scope: !46)
!83 = !DILocation(line: 53, column: 13, scope: !46)
!84 = !DILocation(line: 56, column: 1, scope: !14)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_good", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 94, column: 5, scope: !85)
!87 = !DILocation(line: 95, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 106, type: !89, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 106, type: !91)
!94 = !DILocation(line: 106, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 106, type: !92)
!96 = !DILocation(line: 106, column: 27, scope: !88)
!97 = !DILocation(line: 109, column: 22, scope: !88)
!98 = !DILocation(line: 109, column: 12, scope: !88)
!99 = !DILocation(line: 109, column: 5, scope: !88)
!100 = !DILocation(line: 111, column: 5, scope: !88)
!101 = !DILocation(line: 112, column: 5, scope: !88)
!102 = !DILocation(line: 113, column: 5, scope: !88)
!103 = !DILocation(line: 116, column: 5, scope: !88)
!104 = !DILocation(line: 117, column: 5, scope: !88)
!105 = !DILocation(line: 118, column: 5, scope: !88)
!106 = !DILocation(line: 120, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 65, type: !4)
!109 = !DILocation(line: 65, column: 12, scope: !107)
!110 = !DILocalVariable(name: "myUnion", scope: !107, file: !15, line: 66, type: !21)
!111 = !DILocation(line: 66, column: 72, scope: !107)
!112 = !DILocation(line: 67, column: 10, scope: !107)
!113 = !DILocation(line: 69, column: 20, scope: !107)
!114 = !DILocation(line: 69, column: 10, scope: !107)
!115 = !DILocation(line: 70, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !107, file: !15, line: 70, column: 9)
!117 = !DILocation(line: 70, column: 14, scope: !116)
!118 = !DILocation(line: 70, column: 9, scope: !107)
!119 = !DILocation(line: 70, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 70, column: 23)
!121 = !DILocation(line: 71, column: 5, scope: !107)
!122 = !DILocation(line: 71, column: 13, scope: !107)
!123 = !DILocation(line: 72, column: 26, scope: !107)
!124 = !DILocation(line: 72, column: 13, scope: !107)
!125 = !DILocation(line: 72, column: 24, scope: !107)
!126 = !DILocalVariable(name: "data", scope: !127, file: !15, line: 74, type: !4)
!127 = distinct !DILexicalBlock(scope: !107, file: !15, line: 73, column: 5)
!128 = !DILocation(line: 74, column: 16, scope: !127)
!129 = !DILocation(line: 74, column: 31, scope: !127)
!130 = !DILocalVariable(name: "i", scope: !131, file: !15, line: 76, type: !47)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 75, column: 9)
!132 = !DILocation(line: 76, column: 20, scope: !131)
!133 = !DILocalVariable(name: "source", scope: !131, file: !15, line: 77, type: !52)
!134 = !DILocation(line: 77, column: 18, scope: !131)
!135 = !DILocation(line: 78, column: 13, scope: !131)
!136 = !DILocation(line: 79, column: 13, scope: !131)
!137 = !DILocation(line: 79, column: 27, scope: !131)
!138 = !DILocation(line: 81, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !131, file: !15, line: 81, column: 13)
!140 = !DILocation(line: 81, column: 18, scope: !139)
!141 = !DILocation(line: 81, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 81, column: 13)
!143 = !DILocation(line: 81, column: 27, scope: !142)
!144 = !DILocation(line: 81, column: 13, scope: !139)
!145 = !DILocation(line: 83, column: 34, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !15, line: 82, column: 13)
!147 = !DILocation(line: 83, column: 27, scope: !146)
!148 = !DILocation(line: 83, column: 17, scope: !146)
!149 = !DILocation(line: 83, column: 22, scope: !146)
!150 = !DILocation(line: 83, column: 25, scope: !146)
!151 = !DILocation(line: 84, column: 13, scope: !146)
!152 = !DILocation(line: 81, column: 35, scope: !142)
!153 = !DILocation(line: 81, column: 13, scope: !142)
!154 = distinct !{!154, !144, !155, !77}
!155 = !DILocation(line: 84, column: 13, scope: !139)
!156 = !DILocation(line: 85, column: 13, scope: !131)
!157 = !DILocation(line: 85, column: 25, scope: !131)
!158 = !DILocation(line: 86, column: 23, scope: !131)
!159 = !DILocation(line: 86, column: 13, scope: !131)
!160 = !DILocation(line: 87, column: 18, scope: !131)
!161 = !DILocation(line: 87, column: 13, scope: !131)
!162 = !DILocation(line: 90, column: 1, scope: !107)
