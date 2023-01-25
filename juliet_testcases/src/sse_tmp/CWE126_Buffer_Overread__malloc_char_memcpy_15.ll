; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx1, align 1, !dbg !41
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %call4 = call i64 @strlen(i8* %arraydecay3) #10, !dbg !45
  %mul = mul i64 %call4, 1, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %3, i64 %mul, i1 false), !dbg !42
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx5, align 1, !dbg !48
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @printLine(i8* %arraydecay6), !dbg !50
  %4 = load i8*, i8** %data, align 8, !dbg !51
  call void @free(i8* %4) #8, !dbg !52
  ret void, !dbg !53
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_15_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #8, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #8, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_15_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_15_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx1, align 1, !dbg !98
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  %call4 = call i64 @strlen(i8* %arraydecay3) #10, !dbg !102
  %mul = mul i64 %call4, 1, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %3, i64 %mul, i1 false), !dbg !99
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx5, align 1, !dbg !105
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @printLine(i8* %arraydecay6), !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* %4) #8, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* null, i8** %data, align 8, !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !115
  store i8* %call, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %0, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !124
  %2 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx1, align 1, !dbg !132
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  %3 = load i8*, i8** %data, align 8, !dbg !134
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !135
  %call4 = call i64 @strlen(i8* %arraydecay3) #10, !dbg !136
  %mul = mul i64 %call4, 1, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %3, i64 %mul, i1 false), !dbg !133
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx5, align 1, !dbg !139
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @printLine(i8* %arraydecay6), !dbg !141
  %4 = load i8*, i8** %data, align 8, !dbg !142
  call void @free(i8* %4) #8, !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 31, column: 24, scope: !14)
!22 = !DILocation(line: 31, column: 14, scope: !14)
!23 = !DILocation(line: 32, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 13)
!25 = !DILocation(line: 32, column: 18, scope: !24)
!26 = !DILocation(line: 32, column: 13, scope: !14)
!27 = !DILocation(line: 32, column: 28, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 27)
!29 = !DILocation(line: 33, column: 16, scope: !14)
!30 = !DILocation(line: 33, column: 9, scope: !14)
!31 = !DILocation(line: 34, column: 9, scope: !14)
!32 = !DILocation(line: 34, column: 20, scope: !14)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !15, line: 42, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 42, column: 14, scope: !34)
!39 = !DILocation(line: 43, column: 9, scope: !34)
!40 = !DILocation(line: 44, column: 9, scope: !34)
!41 = !DILocation(line: 44, column: 21, scope: !34)
!42 = !DILocation(line: 47, column: 9, scope: !34)
!43 = !DILocation(line: 47, column: 22, scope: !34)
!44 = !DILocation(line: 47, column: 35, scope: !34)
!45 = !DILocation(line: 47, column: 28, scope: !34)
!46 = !DILocation(line: 47, column: 40, scope: !34)
!47 = !DILocation(line: 48, column: 9, scope: !34)
!48 = !DILocation(line: 48, column: 21, scope: !34)
!49 = !DILocation(line: 49, column: 19, scope: !34)
!50 = !DILocation(line: 49, column: 9, scope: !34)
!51 = !DILocation(line: 50, column: 14, scope: !34)
!52 = !DILocation(line: 50, column: 9, scope: !34)
!53 = !DILocation(line: 52, column: 1, scope: !14)
!54 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_15_good", scope: !15, file: !15, line: 122, type: !16, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 124, column: 5, scope: !54)
!56 = !DILocation(line: 125, column: 5, scope: !54)
!57 = !DILocation(line: 126, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 138, type: !59, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 138, type: !61)
!64 = !DILocation(line: 138, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 138, type: !62)
!66 = !DILocation(line: 138, column: 27, scope: !58)
!67 = !DILocation(line: 141, column: 22, scope: !58)
!68 = !DILocation(line: 141, column: 12, scope: !58)
!69 = !DILocation(line: 141, column: 5, scope: !58)
!70 = !DILocation(line: 143, column: 5, scope: !58)
!71 = !DILocation(line: 144, column: 5, scope: !58)
!72 = !DILocation(line: 145, column: 5, scope: !58)
!73 = !DILocation(line: 148, column: 5, scope: !58)
!74 = !DILocation(line: 149, column: 5, scope: !58)
!75 = !DILocation(line: 150, column: 5, scope: !58)
!76 = !DILocation(line: 152, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 61, type: !4)
!79 = !DILocation(line: 61, column: 12, scope: !77)
!80 = !DILocation(line: 62, column: 10, scope: !77)
!81 = !DILocation(line: 71, column: 24, scope: !77)
!82 = !DILocation(line: 71, column: 14, scope: !77)
!83 = !DILocation(line: 72, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !15, line: 72, column: 13)
!85 = !DILocation(line: 72, column: 18, scope: !84)
!86 = !DILocation(line: 72, column: 13, scope: !77)
!87 = !DILocation(line: 72, column: 28, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 72, column: 27)
!89 = !DILocation(line: 73, column: 16, scope: !77)
!90 = !DILocation(line: 73, column: 9, scope: !77)
!91 = !DILocation(line: 74, column: 9, scope: !77)
!92 = !DILocation(line: 74, column: 21, scope: !77)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !15, line: 78, type: !35)
!94 = distinct !DILexicalBlock(scope: !77, file: !15, line: 77, column: 5)
!95 = !DILocation(line: 78, column: 14, scope: !94)
!96 = !DILocation(line: 79, column: 9, scope: !94)
!97 = !DILocation(line: 80, column: 9, scope: !94)
!98 = !DILocation(line: 80, column: 21, scope: !94)
!99 = !DILocation(line: 83, column: 9, scope: !94)
!100 = !DILocation(line: 83, column: 22, scope: !94)
!101 = !DILocation(line: 83, column: 35, scope: !94)
!102 = !DILocation(line: 83, column: 28, scope: !94)
!103 = !DILocation(line: 83, column: 40, scope: !94)
!104 = !DILocation(line: 84, column: 9, scope: !94)
!105 = !DILocation(line: 84, column: 21, scope: !94)
!106 = !DILocation(line: 85, column: 19, scope: !94)
!107 = !DILocation(line: 85, column: 9, scope: !94)
!108 = !DILocation(line: 86, column: 14, scope: !94)
!109 = !DILocation(line: 86, column: 9, scope: !94)
!110 = !DILocation(line: 88, column: 1, scope: !77)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 91, type: !16, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 93, type: !4)
!113 = !DILocation(line: 93, column: 12, scope: !111)
!114 = !DILocation(line: 94, column: 10, scope: !111)
!115 = !DILocation(line: 99, column: 24, scope: !111)
!116 = !DILocation(line: 99, column: 14, scope: !111)
!117 = !DILocation(line: 100, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !15, line: 100, column: 13)
!119 = !DILocation(line: 100, column: 18, scope: !118)
!120 = !DILocation(line: 100, column: 13, scope: !111)
!121 = !DILocation(line: 100, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 100, column: 27)
!123 = !DILocation(line: 101, column: 16, scope: !111)
!124 = !DILocation(line: 101, column: 9, scope: !111)
!125 = !DILocation(line: 102, column: 9, scope: !111)
!126 = !DILocation(line: 102, column: 21, scope: !111)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !15, line: 110, type: !35)
!128 = distinct !DILexicalBlock(scope: !111, file: !15, line: 109, column: 5)
!129 = !DILocation(line: 110, column: 14, scope: !128)
!130 = !DILocation(line: 111, column: 9, scope: !128)
!131 = !DILocation(line: 112, column: 9, scope: !128)
!132 = !DILocation(line: 112, column: 21, scope: !128)
!133 = !DILocation(line: 115, column: 9, scope: !128)
!134 = !DILocation(line: 115, column: 22, scope: !128)
!135 = !DILocation(line: 115, column: 35, scope: !128)
!136 = !DILocation(line: 115, column: 28, scope: !128)
!137 = !DILocation(line: 115, column: 40, scope: !128)
!138 = !DILocation(line: 116, column: 9, scope: !128)
!139 = !DILocation(line: 116, column: 21, scope: !128)
!140 = !DILocation(line: 117, column: 19, scope: !128)
!141 = !DILocation(line: 117, column: 9, scope: !128)
!142 = !DILocation(line: 118, column: 14, scope: !128)
!143 = !DILocation(line: 118, column: 9, scope: !128)
!144 = !DILocation(line: 120, column: 1, scope: !111)
