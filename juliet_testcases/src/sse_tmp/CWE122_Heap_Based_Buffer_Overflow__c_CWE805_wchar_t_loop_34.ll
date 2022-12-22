; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !42
  store i32* %3, i32** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !47
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !47
  store i32* %4, i32** %data1, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !59
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx3, align 4, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !65
  %cmp4 = icmp ult i64 %5, 100, !dbg !67
  br i1 %cmp4, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !71
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !71
  %8 = load i32*, i32** %data1, align 8, !dbg !72
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !72
  store i32 %7, i32* %arrayidx6, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %10, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !81
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !81
  store i32 0, i32* %arrayidx7, align 4, !dbg !82
  %12 = load i32*, i32** %data1, align 8, !dbg !83
  call void @printWLine(i32* %12), !dbg !84
  %13 = load i32*, i32** %data1, align 8, !dbg !85
  %14 = bitcast i32* %13 to i8*, !dbg !85
  call void @free(i8* %14) #5, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #5, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #5, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType* %myUnion, metadata !114, metadata !DIExpression()), !dbg !115
  store i32* null, i32** %data, align 8, !dbg !116
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !117
  %0 = bitcast i8* %call to i32*, !dbg !118
  store i32* %0, i32** %data, align 8, !dbg !119
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %cmp = icmp eq i32* %1, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %3 = load i32*, i32** %data, align 8, !dbg !128
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !129
  store i32* %3, i32** %unionFirst, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !131, metadata !DIExpression()), !dbg !133
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !134
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !134
  store i32* %4, i32** %data1, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !140
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx3, align 4, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !147
  %cmp4 = icmp ult i64 %5, 100, !dbg !149
  br i1 %cmp4, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !153
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !153
  %8 = load i32*, i32** %data1, align 8, !dbg !154
  %9 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !154
  store i32 %7, i32* %arrayidx6, align 4, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %10, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !162
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !162
  store i32 0, i32* %arrayidx7, align 4, !dbg !163
  %12 = load i32*, i32** %data1, align 8, !dbg !164
  call void @printWLine(i32* %12), !dbg !165
  %13 = load i32*, i32** %data1, align 8, !dbg !166
  %14 = bitcast i32* %13 to i8*, !dbg !166
  call void @free(i8* %14) #5, !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 75, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocation(line: 35, column: 23, scope: !16)
!31 = !DILocation(line: 35, column: 12, scope: !16)
!32 = !DILocation(line: 35, column: 10, scope: !16)
!33 = !DILocation(line: 36, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 9)
!35 = !DILocation(line: 36, column: 14, scope: !34)
!36 = !DILocation(line: 36, column: 9, scope: !16)
!37 = !DILocation(line: 36, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 36, column: 23)
!39 = !DILocation(line: 37, column: 5, scope: !16)
!40 = !DILocation(line: 37, column: 13, scope: !16)
!41 = !DILocation(line: 38, column: 26, scope: !16)
!42 = !DILocation(line: 38, column: 13, scope: !16)
!43 = !DILocation(line: 38, column: 24, scope: !16)
!44 = !DILocalVariable(name: "data", scope: !45, file: !17, line: 40, type: !4)
!45 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!46 = !DILocation(line: 40, column: 19, scope: !45)
!47 = !DILocation(line: 40, column: 34, scope: !45)
!48 = !DILocalVariable(name: "i", scope: !49, file: !17, line: 42, type: !50)
!49 = distinct !DILexicalBlock(scope: !45, file: !17, line: 41, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 42, column: 20, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !49, file: !17, line: 43, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 43, column: 21, scope: !49)
!58 = !DILocation(line: 44, column: 21, scope: !49)
!59 = !DILocation(line: 44, column: 13, scope: !49)
!60 = !DILocation(line: 45, column: 13, scope: !49)
!61 = !DILocation(line: 45, column: 27, scope: !49)
!62 = !DILocation(line: 47, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !49, file: !17, line: 47, column: 13)
!64 = !DILocation(line: 47, column: 18, scope: !63)
!65 = !DILocation(line: 47, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !17, line: 47, column: 13)
!67 = !DILocation(line: 47, column: 27, scope: !66)
!68 = !DILocation(line: 47, column: 13, scope: !63)
!69 = !DILocation(line: 49, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !17, line: 48, column: 13)
!71 = !DILocation(line: 49, column: 27, scope: !70)
!72 = !DILocation(line: 49, column: 17, scope: !70)
!73 = !DILocation(line: 49, column: 22, scope: !70)
!74 = !DILocation(line: 49, column: 25, scope: !70)
!75 = !DILocation(line: 50, column: 13, scope: !70)
!76 = !DILocation(line: 47, column: 35, scope: !66)
!77 = !DILocation(line: 47, column: 13, scope: !66)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 50, column: 13, scope: !63)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 51, column: 13, scope: !49)
!82 = !DILocation(line: 51, column: 25, scope: !49)
!83 = !DILocation(line: 52, column: 24, scope: !49)
!84 = !DILocation(line: 52, column: 13, scope: !49)
!85 = !DILocation(line: 53, column: 18, scope: !49)
!86 = !DILocation(line: 53, column: 13, scope: !49)
!87 = !DILocation(line: 56, column: 1, scope: !16)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_34_good", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 94, column: 5, scope: !88)
!90 = !DILocation(line: 95, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 106, type: !92, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !7, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !17, line: 106, type: !7)
!98 = !DILocation(line: 106, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !17, line: 106, type: !94)
!100 = !DILocation(line: 106, column: 27, scope: !91)
!101 = !DILocation(line: 109, column: 22, scope: !91)
!102 = !DILocation(line: 109, column: 12, scope: !91)
!103 = !DILocation(line: 109, column: 5, scope: !91)
!104 = !DILocation(line: 111, column: 5, scope: !91)
!105 = !DILocation(line: 112, column: 5, scope: !91)
!106 = !DILocation(line: 113, column: 5, scope: !91)
!107 = !DILocation(line: 116, column: 5, scope: !91)
!108 = !DILocation(line: 117, column: 5, scope: !91)
!109 = !DILocation(line: 118, column: 5, scope: !91)
!110 = !DILocation(line: 120, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 65, type: !4)
!113 = !DILocation(line: 65, column: 15, scope: !111)
!114 = !DILocalVariable(name: "myUnion", scope: !111, file: !17, line: 66, type: !23)
!115 = !DILocation(line: 66, column: 75, scope: !111)
!116 = !DILocation(line: 67, column: 10, scope: !111)
!117 = !DILocation(line: 69, column: 23, scope: !111)
!118 = !DILocation(line: 69, column: 12, scope: !111)
!119 = !DILocation(line: 69, column: 10, scope: !111)
!120 = !DILocation(line: 70, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !17, line: 70, column: 9)
!122 = !DILocation(line: 70, column: 14, scope: !121)
!123 = !DILocation(line: 70, column: 9, scope: !111)
!124 = !DILocation(line: 70, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !17, line: 70, column: 23)
!126 = !DILocation(line: 71, column: 5, scope: !111)
!127 = !DILocation(line: 71, column: 13, scope: !111)
!128 = !DILocation(line: 72, column: 26, scope: !111)
!129 = !DILocation(line: 72, column: 13, scope: !111)
!130 = !DILocation(line: 72, column: 24, scope: !111)
!131 = !DILocalVariable(name: "data", scope: !132, file: !17, line: 74, type: !4)
!132 = distinct !DILexicalBlock(scope: !111, file: !17, line: 73, column: 5)
!133 = !DILocation(line: 74, column: 19, scope: !132)
!134 = !DILocation(line: 74, column: 34, scope: !132)
!135 = !DILocalVariable(name: "i", scope: !136, file: !17, line: 76, type: !50)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 75, column: 9)
!137 = !DILocation(line: 76, column: 20, scope: !136)
!138 = !DILocalVariable(name: "source", scope: !136, file: !17, line: 77, type: !54)
!139 = !DILocation(line: 77, column: 21, scope: !136)
!140 = !DILocation(line: 78, column: 21, scope: !136)
!141 = !DILocation(line: 78, column: 13, scope: !136)
!142 = !DILocation(line: 79, column: 13, scope: !136)
!143 = !DILocation(line: 79, column: 27, scope: !136)
!144 = !DILocation(line: 81, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !136, file: !17, line: 81, column: 13)
!146 = !DILocation(line: 81, column: 18, scope: !145)
!147 = !DILocation(line: 81, column: 25, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !17, line: 81, column: 13)
!149 = !DILocation(line: 81, column: 27, scope: !148)
!150 = !DILocation(line: 81, column: 13, scope: !145)
!151 = !DILocation(line: 83, column: 34, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !17, line: 82, column: 13)
!153 = !DILocation(line: 83, column: 27, scope: !152)
!154 = !DILocation(line: 83, column: 17, scope: !152)
!155 = !DILocation(line: 83, column: 22, scope: !152)
!156 = !DILocation(line: 83, column: 25, scope: !152)
!157 = !DILocation(line: 84, column: 13, scope: !152)
!158 = !DILocation(line: 81, column: 35, scope: !148)
!159 = !DILocation(line: 81, column: 13, scope: !148)
!160 = distinct !{!160, !150, !161, !80}
!161 = !DILocation(line: 84, column: 13, scope: !145)
!162 = !DILocation(line: 85, column: 13, scope: !136)
!163 = !DILocation(line: 85, column: 25, scope: !136)
!164 = !DILocation(line: 86, column: 24, scope: !136)
!165 = !DILocation(line: 86, column: 13, scope: !136)
!166 = !DILocation(line: 87, column: 18, scope: !136)
!167 = !DILocation(line: 87, column: 13, scope: !136)
!168 = !DILocation(line: 90, column: 1, scope: !111)
