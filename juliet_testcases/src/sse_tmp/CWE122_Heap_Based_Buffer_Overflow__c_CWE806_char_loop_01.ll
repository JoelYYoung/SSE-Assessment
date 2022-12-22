; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !43, metadata !DIExpression()), !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !46
  store i64 %call1, i64* %dataLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !51
  %6 = load i64, i64* %dataLen, align 8, !dbg !53
  %cmp2 = icmp ult i64 %5, %6, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !56
  %8 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !56
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !56
  %10 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !60
  store i8 %9, i8* %arrayidx4, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %11, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !68
  store i8 0, i8* %arrayidx5, align 1, !dbg !69
  %12 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* %12), !dbg !71
  %13 = load i8*, i8** %data, align 8, !dbg !72
  call void @free(i8* %13) #7, !dbg !73
  ret void, !dbg !74
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %cmp = icmp eq i8* %0, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !109
  %2 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !117, metadata !DIExpression()), !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !120
  store i64 %call1, i64* %dataLen, align 8, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !125
  %6 = load i64, i64* %dataLen, align 8, !dbg !127
  %cmp2 = icmp ult i64 %5, %6, !dbg !128
  br i1 %cmp2, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !130
  %8 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !130
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !130
  %10 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !134
  store i8 %9, i8* %arrayidx4, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %11, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !141
  store i8 0, i8* %arrayidx5, align 1, !dbg !142
  %12 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* %12), !dbg !144
  %13 = load i8*, i8** %data, align 8, !dbg !145
  call void @free(i8* %13) #7, !dbg !146
  ret void, !dbg !147
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 29, column: 12, scope: !14)
!29 = !DILocation(line: 29, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 30, column: 17, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 32, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 32, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 33, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 33, column: 16, scope: !33)
!43 = !DILocalVariable(name: "dataLen", scope: !33, file: !15, line: 33, type: !39)
!44 = !DILocation(line: 33, column: 19, scope: !33)
!45 = !DILocation(line: 34, column: 26, scope: !33)
!46 = !DILocation(line: 34, column: 19, scope: !33)
!47 = !DILocation(line: 34, column: 17, scope: !33)
!48 = !DILocation(line: 36, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !33, file: !15, line: 36, column: 9)
!50 = !DILocation(line: 36, column: 14, scope: !49)
!51 = !DILocation(line: 36, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 36, column: 9)
!53 = !DILocation(line: 36, column: 25, scope: !52)
!54 = !DILocation(line: 36, column: 23, scope: !52)
!55 = !DILocation(line: 36, column: 9, scope: !49)
!56 = !DILocation(line: 38, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !15, line: 37, column: 9)
!58 = !DILocation(line: 38, column: 28, scope: !57)
!59 = !DILocation(line: 38, column: 18, scope: !57)
!60 = !DILocation(line: 38, column: 13, scope: !57)
!61 = !DILocation(line: 38, column: 21, scope: !57)
!62 = !DILocation(line: 39, column: 9, scope: !57)
!63 = !DILocation(line: 36, column: 35, scope: !52)
!64 = !DILocation(line: 36, column: 9, scope: !52)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 39, column: 9, scope: !49)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 40, column: 9, scope: !33)
!69 = !DILocation(line: 40, column: 20, scope: !33)
!70 = !DILocation(line: 41, column: 19, scope: !33)
!71 = !DILocation(line: 41, column: 9, scope: !33)
!72 = !DILocation(line: 42, column: 14, scope: !33)
!73 = !DILocation(line: 42, column: 9, scope: !33)
!74 = !DILocation(line: 44, column: 1, scope: !14)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_01_good", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 76, column: 5, scope: !75)
!77 = !DILocation(line: 77, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 89, type: !79, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !15, line: 89, type: !81)
!84 = !DILocation(line: 89, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !15, line: 89, type: !82)
!86 = !DILocation(line: 89, column: 27, scope: !78)
!87 = !DILocation(line: 92, column: 22, scope: !78)
!88 = !DILocation(line: 92, column: 12, scope: !78)
!89 = !DILocation(line: 92, column: 5, scope: !78)
!90 = !DILocation(line: 94, column: 5, scope: !78)
!91 = !DILocation(line: 95, column: 5, scope: !78)
!92 = !DILocation(line: 96, column: 5, scope: !78)
!93 = !DILocation(line: 99, column: 5, scope: !78)
!94 = !DILocation(line: 100, column: 5, scope: !78)
!95 = !DILocation(line: 101, column: 5, scope: !78)
!96 = !DILocation(line: 103, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !15, line: 53, type: !4)
!99 = !DILocation(line: 53, column: 12, scope: !97)
!100 = !DILocation(line: 54, column: 20, scope: !97)
!101 = !DILocation(line: 54, column: 10, scope: !97)
!102 = !DILocation(line: 55, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !15, line: 55, column: 9)
!104 = !DILocation(line: 55, column: 14, scope: !103)
!105 = !DILocation(line: 55, column: 9, scope: !97)
!106 = !DILocation(line: 55, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 55, column: 23)
!108 = !DILocation(line: 57, column: 12, scope: !97)
!109 = !DILocation(line: 57, column: 5, scope: !97)
!110 = !DILocation(line: 58, column: 5, scope: !97)
!111 = !DILocation(line: 58, column: 16, scope: !97)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !15, line: 60, type: !34)
!113 = distinct !DILexicalBlock(scope: !97, file: !15, line: 59, column: 5)
!114 = !DILocation(line: 60, column: 14, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !113, file: !15, line: 61, type: !39)
!116 = !DILocation(line: 61, column: 16, scope: !113)
!117 = !DILocalVariable(name: "dataLen", scope: !113, file: !15, line: 61, type: !39)
!118 = !DILocation(line: 61, column: 19, scope: !113)
!119 = !DILocation(line: 62, column: 26, scope: !113)
!120 = !DILocation(line: 62, column: 19, scope: !113)
!121 = !DILocation(line: 62, column: 17, scope: !113)
!122 = !DILocation(line: 64, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !15, line: 64, column: 9)
!124 = !DILocation(line: 64, column: 14, scope: !123)
!125 = !DILocation(line: 64, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !15, line: 64, column: 9)
!127 = !DILocation(line: 64, column: 25, scope: !126)
!128 = !DILocation(line: 64, column: 23, scope: !126)
!129 = !DILocation(line: 64, column: 9, scope: !123)
!130 = !DILocation(line: 66, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !15, line: 65, column: 9)
!132 = !DILocation(line: 66, column: 28, scope: !131)
!133 = !DILocation(line: 66, column: 18, scope: !131)
!134 = !DILocation(line: 66, column: 13, scope: !131)
!135 = !DILocation(line: 66, column: 21, scope: !131)
!136 = !DILocation(line: 67, column: 9, scope: !131)
!137 = !DILocation(line: 64, column: 35, scope: !126)
!138 = !DILocation(line: 64, column: 9, scope: !126)
!139 = distinct !{!139, !129, !140, !67}
!140 = !DILocation(line: 67, column: 9, scope: !123)
!141 = !DILocation(line: 68, column: 9, scope: !113)
!142 = !DILocation(line: 68, column: 20, scope: !113)
!143 = !DILocation(line: 69, column: 19, scope: !113)
!144 = !DILocation(line: 69, column: 9, scope: !113)
!145 = !DILocation(line: 70, column: 14, scope: !113)
!146 = !DILocation(line: 70, column: 9, scope: !113)
!147 = !DILocation(line: 72, column: 1, scope: !97)
