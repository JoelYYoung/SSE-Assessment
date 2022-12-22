; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType = type { i8* }

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType* %myUnion to i8**, !dbg !37
  store i8* %1, i8** %unionFirst, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType* %myUnion to i8**, !dbg !42
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !42
  store i8* %2, i8** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !56
  %call2 = call i64 @strlen(i8* %arraydecay) #9, !dbg !57
  store i64 %call2, i64* %sourceLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !62
  %5 = load i64, i64* %sourceLen, align 8, !dbg !64
  %add = add i64 %5, 1, !dbg !65
  %cmp3 = icmp ult i64 %4, %add, !dbg !66
  br i1 %cmp3, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !70
  %7 = load i8, i8* %arrayidx, align 1, !dbg !70
  %8 = load i8*, i8** %data1, align 8, !dbg !71
  %9 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !71
  store i8 %7, i8* %arrayidx4, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %10, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data1, align 8, !dbg !80
  call void @printLine(i8* %11), !dbg !81
  %12 = load i8*, i8** %data1, align 8, !dbg !82
  call void @free(i8* %12) #7, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_good() #0 !dbg !85 {
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
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_bad(), !dbg !104
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
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType* %myUnion, metadata !110, metadata !DIExpression()), !dbg !111
  store i8* null, i8** %data, align 8, !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !113
  store i8* %call, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %cmp = icmp eq i8* %0, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !121
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType* %myUnion to i8**, !dbg !122
  store i8* %1, i8** %unionFirst, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType* %myUnion to i8**, !dbg !127
  %2 = load i8*, i8** %unionSecond, align 8, !dbg !127
  store i8* %2, i8** %data1, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !135
  %call2 = call i64 @strlen(i8* %arraydecay) #9, !dbg !136
  store i64 %call2, i64* %sourceLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !141
  %5 = load i64, i64* %sourceLen, align 8, !dbg !143
  %add = add i64 %5, 1, !dbg !144
  %cmp3 = icmp ult i64 %4, %add, !dbg !145
  br i1 %cmp3, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !149
  %7 = load i8, i8* %arrayidx, align 1, !dbg !149
  %8 = load i8*, i8** %data1, align 8, !dbg !150
  %9 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !150
  store i8 %7, i8* %arrayidx4, align 1, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %10, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data1, align 8, !dbg !158
  call void @printLine(i8* %11), !dbg !159
  %12 = load i8*, i8** %data1, align 8, !dbg !160
  call void @free(i8* %12) #7, !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 36, type: !4)
!19 = !DILocation(line: 36, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 37, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_unionType", file: !15, line: 30, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 26, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 28, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 29, baseType: !4, size: 64)
!26 = !DILocation(line: 37, column: 72, scope: !14)
!27 = !DILocation(line: 38, column: 10, scope: !14)
!28 = !DILocation(line: 40, column: 20, scope: !14)
!29 = !DILocation(line: 40, column: 10, scope: !14)
!30 = !DILocation(line: 41, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!32 = !DILocation(line: 41, column: 14, scope: !31)
!33 = !DILocation(line: 41, column: 9, scope: !14)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 41, column: 23)
!36 = !DILocation(line: 42, column: 26, scope: !14)
!37 = !DILocation(line: 42, column: 13, scope: !14)
!38 = !DILocation(line: 42, column: 24, scope: !14)
!39 = !DILocalVariable(name: "data", scope: !40, file: !15, line: 44, type: !4)
!40 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!41 = !DILocation(line: 44, column: 16, scope: !40)
!42 = !DILocation(line: 44, column: 31, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !15, line: 46, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 45, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 46, column: 18, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !15, line: 47, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 47, column: 20, scope: !44)
!54 = !DILocalVariable(name: "sourceLen", scope: !44, file: !15, line: 47, type: !50)
!55 = !DILocation(line: 47, column: 23, scope: !44)
!56 = !DILocation(line: 48, column: 32, scope: !44)
!57 = !DILocation(line: 48, column: 25, scope: !44)
!58 = !DILocation(line: 48, column: 23, scope: !44)
!59 = !DILocation(line: 51, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !44, file: !15, line: 51, column: 13)
!61 = !DILocation(line: 51, column: 18, scope: !60)
!62 = !DILocation(line: 51, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 51, column: 13)
!64 = !DILocation(line: 51, column: 29, scope: !63)
!65 = !DILocation(line: 51, column: 39, scope: !63)
!66 = !DILocation(line: 51, column: 27, scope: !63)
!67 = !DILocation(line: 51, column: 13, scope: !60)
!68 = !DILocation(line: 53, column: 34, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !15, line: 52, column: 13)
!70 = !DILocation(line: 53, column: 27, scope: !69)
!71 = !DILocation(line: 53, column: 17, scope: !69)
!72 = !DILocation(line: 53, column: 22, scope: !69)
!73 = !DILocation(line: 53, column: 25, scope: !69)
!74 = !DILocation(line: 54, column: 13, scope: !69)
!75 = !DILocation(line: 51, column: 45, scope: !63)
!76 = !DILocation(line: 51, column: 13, scope: !63)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 54, column: 13, scope: !60)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 55, column: 23, scope: !44)
!81 = !DILocation(line: 55, column: 13, scope: !44)
!82 = !DILocation(line: 56, column: 18, scope: !44)
!83 = !DILocation(line: 56, column: 13, scope: !44)
!84 = !DILocation(line: 59, column: 1, scope: !14)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_34_good", scope: !15, file: !15, line: 93, type: !16, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 95, column: 5, scope: !85)
!87 = !DILocation(line: 96, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 107, type: !89, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 107, type: !91)
!94 = !DILocation(line: 107, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 107, type: !92)
!96 = !DILocation(line: 107, column: 27, scope: !88)
!97 = !DILocation(line: 110, column: 22, scope: !88)
!98 = !DILocation(line: 110, column: 12, scope: !88)
!99 = !DILocation(line: 110, column: 5, scope: !88)
!100 = !DILocation(line: 112, column: 5, scope: !88)
!101 = !DILocation(line: 113, column: 5, scope: !88)
!102 = !DILocation(line: 114, column: 5, scope: !88)
!103 = !DILocation(line: 117, column: 5, scope: !88)
!104 = !DILocation(line: 118, column: 5, scope: !88)
!105 = !DILocation(line: 119, column: 5, scope: !88)
!106 = !DILocation(line: 121, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 68, type: !4)
!109 = !DILocation(line: 68, column: 12, scope: !107)
!110 = !DILocalVariable(name: "myUnion", scope: !107, file: !15, line: 69, type: !21)
!111 = !DILocation(line: 69, column: 72, scope: !107)
!112 = !DILocation(line: 70, column: 10, scope: !107)
!113 = !DILocation(line: 72, column: 20, scope: !107)
!114 = !DILocation(line: 72, column: 10, scope: !107)
!115 = !DILocation(line: 73, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !107, file: !15, line: 73, column: 9)
!117 = !DILocation(line: 73, column: 14, scope: !116)
!118 = !DILocation(line: 73, column: 9, scope: !107)
!119 = !DILocation(line: 73, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 73, column: 23)
!121 = !DILocation(line: 74, column: 26, scope: !107)
!122 = !DILocation(line: 74, column: 13, scope: !107)
!123 = !DILocation(line: 74, column: 24, scope: !107)
!124 = !DILocalVariable(name: "data", scope: !125, file: !15, line: 76, type: !4)
!125 = distinct !DILexicalBlock(scope: !107, file: !15, line: 75, column: 5)
!126 = !DILocation(line: 76, column: 16, scope: !125)
!127 = !DILocation(line: 76, column: 31, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !15, line: 78, type: !45)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 77, column: 9)
!130 = !DILocation(line: 78, column: 18, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !15, line: 79, type: !50)
!132 = !DILocation(line: 79, column: 20, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !15, line: 79, type: !50)
!134 = !DILocation(line: 79, column: 23, scope: !129)
!135 = !DILocation(line: 80, column: 32, scope: !129)
!136 = !DILocation(line: 80, column: 25, scope: !129)
!137 = !DILocation(line: 80, column: 23, scope: !129)
!138 = !DILocation(line: 83, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !15, line: 83, column: 13)
!140 = !DILocation(line: 83, column: 18, scope: !139)
!141 = !DILocation(line: 83, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !15, line: 83, column: 13)
!143 = !DILocation(line: 83, column: 29, scope: !142)
!144 = !DILocation(line: 83, column: 39, scope: !142)
!145 = !DILocation(line: 83, column: 27, scope: !142)
!146 = !DILocation(line: 83, column: 13, scope: !139)
!147 = !DILocation(line: 85, column: 34, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !15, line: 84, column: 13)
!149 = !DILocation(line: 85, column: 27, scope: !148)
!150 = !DILocation(line: 85, column: 17, scope: !148)
!151 = !DILocation(line: 85, column: 22, scope: !148)
!152 = !DILocation(line: 85, column: 25, scope: !148)
!153 = !DILocation(line: 86, column: 13, scope: !148)
!154 = !DILocation(line: 83, column: 45, scope: !142)
!155 = !DILocation(line: 83, column: 13, scope: !142)
!156 = distinct !{!156, !146, !157, !79}
!157 = !DILocation(line: 86, column: 13, scope: !139)
!158 = !DILocation(line: 87, column: 23, scope: !129)
!159 = !DILocation(line: 87, column: 13, scope: !129)
!160 = !DILocation(line: 88, column: 18, scope: !129)
!161 = !DILocation(line: 88, column: 13, scope: !129)
!162 = !DILocation(line: 91, column: 1, scope: !107)
