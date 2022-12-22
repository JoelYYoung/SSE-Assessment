; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %3, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType* %myUnion to i8**, !dbg !45
  %4 = load i8*, i8** %unionSecond, align 8, !dbg !45
  store i8* %4, i8** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !57, metadata !DIExpression()), !dbg !58
  %6 = load i8*, i8** %data1, align 8, !dbg !59
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !60
  store i64 %call2, i64* %dataLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !65
  %8 = load i64, i64* %dataLen, align 8, !dbg !67
  %cmp3 = icmp ult i64 %7, %8, !dbg !68
  br i1 %cmp3, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data1, align 8, !dbg !70
  %10 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !70
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !70
  %12 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !74
  store i8 %11, i8* %arrayidx5, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %13, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !82
  store i8 0, i8* %arrayidx6, align 1, !dbg !83
  %14 = load i8*, i8** %data1, align 8, !dbg !84
  call void @printLine(i8* %14), !dbg !85
  %15 = load i8*, i8** %data1, align 8, !dbg !86
  call void @free(i8* %15) #7, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType* %myUnion, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !116
  store i8* %call, i8** %data, align 8, !dbg !117
  %0 = load i8*, i8** %data, align 8, !dbg !118
  %cmp = icmp eq i8* %0, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !125
  %2 = load i8*, i8** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  %3 = load i8*, i8** %data, align 8, !dbg !128
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType* %myUnion to i8**, !dbg !129
  store i8* %3, i8** %unionFirst, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !131, metadata !DIExpression()), !dbg !133
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType* %myUnion to i8**, !dbg !134
  %4 = load i8*, i8** %unionSecond, align 8, !dbg !134
  store i8* %4, i8** %data1, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !137
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !140, metadata !DIExpression()), !dbg !141
  %6 = load i8*, i8** %data1, align 8, !dbg !142
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !143
  store i64 %call2, i64* %dataLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !148
  %8 = load i64, i64* %dataLen, align 8, !dbg !150
  %cmp3 = icmp ult i64 %7, %8, !dbg !151
  br i1 %cmp3, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data1, align 8, !dbg !153
  %10 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !153
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !153
  %12 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !157
  store i8 %11, i8* %arrayidx5, align 1, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %13, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !164
  store i8 0, i8* %arrayidx6, align 1, !dbg !165
  %14 = load i8*, i8** %data1, align 8, !dbg !166
  call void @printLine(i8* %14), !dbg !167
  %15 = load i8*, i8** %data1, align 8, !dbg !168
  call void @free(i8* %15) #7, !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 72, scope: !14)
!27 = !DILocation(line: 33, column: 20, scope: !14)
!28 = !DILocation(line: 33, column: 10, scope: !14)
!29 = !DILocation(line: 34, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!31 = !DILocation(line: 34, column: 14, scope: !30)
!32 = !DILocation(line: 34, column: 9, scope: !14)
!33 = !DILocation(line: 34, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 34, column: 23)
!35 = !DILocation(line: 36, column: 12, scope: !14)
!36 = !DILocation(line: 36, column: 5, scope: !14)
!37 = !DILocation(line: 37, column: 5, scope: !14)
!38 = !DILocation(line: 37, column: 17, scope: !14)
!39 = !DILocation(line: 38, column: 26, scope: !14)
!40 = !DILocation(line: 38, column: 13, scope: !14)
!41 = !DILocation(line: 38, column: 24, scope: !14)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 40, type: !4)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 16, scope: !43)
!45 = !DILocation(line: 40, column: 31, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !15, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 41, column: 9)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 50)
!51 = !DILocation(line: 42, column: 18, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !47, file: !15, line: 43, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 43, column: 20, scope: !47)
!57 = !DILocalVariable(name: "dataLen", scope: !47, file: !15, line: 43, type: !53)
!58 = !DILocation(line: 43, column: 23, scope: !47)
!59 = !DILocation(line: 44, column: 30, scope: !47)
!60 = !DILocation(line: 44, column: 23, scope: !47)
!61 = !DILocation(line: 44, column: 21, scope: !47)
!62 = !DILocation(line: 46, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !47, file: !15, line: 46, column: 13)
!64 = !DILocation(line: 46, column: 18, scope: !63)
!65 = !DILocation(line: 46, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 46, column: 13)
!67 = !DILocation(line: 46, column: 29, scope: !66)
!68 = !DILocation(line: 46, column: 27, scope: !66)
!69 = !DILocation(line: 46, column: 13, scope: !63)
!70 = !DILocation(line: 48, column: 27, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !15, line: 47, column: 13)
!72 = !DILocation(line: 48, column: 32, scope: !71)
!73 = !DILocation(line: 48, column: 22, scope: !71)
!74 = !DILocation(line: 48, column: 17, scope: !71)
!75 = !DILocation(line: 48, column: 25, scope: !71)
!76 = !DILocation(line: 49, column: 13, scope: !71)
!77 = !DILocation(line: 46, column: 39, scope: !66)
!78 = !DILocation(line: 46, column: 13, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 49, column: 13, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 50, column: 13, scope: !47)
!83 = !DILocation(line: 50, column: 24, scope: !47)
!84 = !DILocation(line: 51, column: 23, scope: !47)
!85 = !DILocation(line: 51, column: 13, scope: !47)
!86 = !DILocation(line: 52, column: 18, scope: !47)
!87 = !DILocation(line: 52, column: 13, scope: !47)
!88 = !DILocation(line: 55, column: 1, scope: !14)
!89 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_34_good", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 92, column: 5, scope: !89)
!91 = !DILocation(line: 93, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !93, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !95, !96}
!95 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !15, line: 104, type: !95)
!98 = !DILocation(line: 104, column: 14, scope: !92)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !15, line: 104, type: !96)
!100 = !DILocation(line: 104, column: 27, scope: !92)
!101 = !DILocation(line: 107, column: 22, scope: !92)
!102 = !DILocation(line: 107, column: 12, scope: !92)
!103 = !DILocation(line: 107, column: 5, scope: !92)
!104 = !DILocation(line: 109, column: 5, scope: !92)
!105 = !DILocation(line: 110, column: 5, scope: !92)
!106 = !DILocation(line: 111, column: 5, scope: !92)
!107 = !DILocation(line: 114, column: 5, scope: !92)
!108 = !DILocation(line: 115, column: 5, scope: !92)
!109 = !DILocation(line: 116, column: 5, scope: !92)
!110 = !DILocation(line: 118, column: 5, scope: !92)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 64, type: !4)
!113 = !DILocation(line: 64, column: 12, scope: !111)
!114 = !DILocalVariable(name: "myUnion", scope: !111, file: !15, line: 65, type: !21)
!115 = !DILocation(line: 65, column: 72, scope: !111)
!116 = !DILocation(line: 66, column: 20, scope: !111)
!117 = !DILocation(line: 66, column: 10, scope: !111)
!118 = !DILocation(line: 67, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !15, line: 67, column: 9)
!120 = !DILocation(line: 67, column: 14, scope: !119)
!121 = !DILocation(line: 67, column: 9, scope: !111)
!122 = !DILocation(line: 67, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 67, column: 23)
!124 = !DILocation(line: 69, column: 12, scope: !111)
!125 = !DILocation(line: 69, column: 5, scope: !111)
!126 = !DILocation(line: 70, column: 5, scope: !111)
!127 = !DILocation(line: 70, column: 16, scope: !111)
!128 = !DILocation(line: 71, column: 26, scope: !111)
!129 = !DILocation(line: 71, column: 13, scope: !111)
!130 = !DILocation(line: 71, column: 24, scope: !111)
!131 = !DILocalVariable(name: "data", scope: !132, file: !15, line: 73, type: !4)
!132 = distinct !DILexicalBlock(scope: !111, file: !15, line: 72, column: 5)
!133 = !DILocation(line: 73, column: 16, scope: !132)
!134 = !DILocation(line: 73, column: 31, scope: !132)
!135 = !DILocalVariable(name: "dest", scope: !136, file: !15, line: 75, type: !48)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 74, column: 9)
!137 = !DILocation(line: 75, column: 18, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !136, file: !15, line: 76, type: !53)
!139 = !DILocation(line: 76, column: 20, scope: !136)
!140 = !DILocalVariable(name: "dataLen", scope: !136, file: !15, line: 76, type: !53)
!141 = !DILocation(line: 76, column: 23, scope: !136)
!142 = !DILocation(line: 77, column: 30, scope: !136)
!143 = !DILocation(line: 77, column: 23, scope: !136)
!144 = !DILocation(line: 77, column: 21, scope: !136)
!145 = !DILocation(line: 79, column: 20, scope: !146)
!146 = distinct !DILexicalBlock(scope: !136, file: !15, line: 79, column: 13)
!147 = !DILocation(line: 79, column: 18, scope: !146)
!148 = !DILocation(line: 79, column: 25, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 79, column: 13)
!150 = !DILocation(line: 79, column: 29, scope: !149)
!151 = !DILocation(line: 79, column: 27, scope: !149)
!152 = !DILocation(line: 79, column: 13, scope: !146)
!153 = !DILocation(line: 81, column: 27, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !15, line: 80, column: 13)
!155 = !DILocation(line: 81, column: 32, scope: !154)
!156 = !DILocation(line: 81, column: 22, scope: !154)
!157 = !DILocation(line: 81, column: 17, scope: !154)
!158 = !DILocation(line: 81, column: 25, scope: !154)
!159 = !DILocation(line: 82, column: 13, scope: !154)
!160 = !DILocation(line: 79, column: 39, scope: !149)
!161 = !DILocation(line: 79, column: 13, scope: !149)
!162 = distinct !{!162, !152, !163, !81}
!163 = !DILocation(line: 82, column: 13, scope: !146)
!164 = !DILocation(line: 83, column: 13, scope: !136)
!165 = !DILocation(line: 83, column: 24, scope: !136)
!166 = !DILocation(line: 84, column: 23, scope: !136)
!167 = !DILocation(line: 84, column: 13, scope: !136)
!168 = !DILocation(line: 85, column: 18, scope: !136)
!169 = !DILocation(line: 85, column: 13, scope: !136)
!170 = !DILocation(line: 88, column: 1, scope: !111)
