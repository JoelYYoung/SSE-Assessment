; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_04.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx1, align 1, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %call4 = call i64 @strlen(i8* %arraydecay3) #10, !dbg !47
  %mul = mul i64 %call4, 1, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %3, i64 %mul, i1 false), !dbg !44
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx5, align 1, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @printLine(i8* %arraydecay6), !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  call void @free(i8* %4) #8, !dbg !54
  ret void, !dbg !55
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_04_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #8, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #8, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_04_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_04_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i8* null, i8** %data, align 8, !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !83
  store i8* %call, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %cmp = icmp eq i8* %0, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !100
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx1, align 1, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  %call4 = call i64 @strlen(i8* %arraydecay3) #10, !dbg !106
  %mul = mul i64 %call4, 1, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %3, i64 %mul, i1 false), !dbg !103
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx5, align 1, !dbg !109
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @printLine(i8* %arraydecay6), !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %4) #8, !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i8* null, i8** %data, align 8, !dbg !118
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !119
  store i8* %call, i8** %data, align 8, !dbg !122
  %0 = load i8*, i8** %data, align 8, !dbg !123
  %cmp = icmp eq i8* %0, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !130
  %2 = load i8*, i8** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !136
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !137
  store i8 0, i8* %arrayidx1, align 1, !dbg !138
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  %3 = load i8*, i8** %data, align 8, !dbg !140
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  %call4 = call i64 @strlen(i8* %arraydecay3) #10, !dbg !142
  %mul = mul i64 %call4, 1, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %3, i64 %mul, i1 false), !dbg !139
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !144
  store i8 0, i8* %arrayidx5, align 1, !dbg !145
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !146
  call void @printLine(i8* %arraydecay6), !dbg !147
  %4 = load i8*, i8** %data, align 8, !dbg !148
  call void @free(i8* %4) #8, !dbg !149
  ret void, !dbg !150
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_04.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_04_bad", scope: !15, file: !15, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_04.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 32, type: !4)
!19 = !DILocation(line: 32, column: 12, scope: !14)
!20 = !DILocation(line: 33, column: 10, scope: !14)
!21 = !DILocation(line: 37, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 8)
!24 = !DILocation(line: 37, column: 14, scope: !22)
!25 = !DILocation(line: 38, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 38, column: 13)
!27 = !DILocation(line: 38, column: 18, scope: !26)
!28 = !DILocation(line: 38, column: 13, scope: !22)
!29 = !DILocation(line: 38, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 38, column: 27)
!31 = !DILocation(line: 39, column: 16, scope: !22)
!32 = !DILocation(line: 39, column: 9, scope: !22)
!33 = !DILocation(line: 40, column: 9, scope: !22)
!34 = !DILocation(line: 40, column: 20, scope: !22)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !15, line: 43, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 43, column: 14, scope: !36)
!41 = !DILocation(line: 44, column: 9, scope: !36)
!42 = !DILocation(line: 45, column: 9, scope: !36)
!43 = !DILocation(line: 45, column: 21, scope: !36)
!44 = !DILocation(line: 48, column: 9, scope: !36)
!45 = !DILocation(line: 48, column: 22, scope: !36)
!46 = !DILocation(line: 48, column: 35, scope: !36)
!47 = !DILocation(line: 48, column: 28, scope: !36)
!48 = !DILocation(line: 48, column: 40, scope: !36)
!49 = !DILocation(line: 49, column: 9, scope: !36)
!50 = !DILocation(line: 49, column: 21, scope: !36)
!51 = !DILocation(line: 50, column: 19, scope: !36)
!52 = !DILocation(line: 50, column: 9, scope: !36)
!53 = !DILocation(line: 51, column: 14, scope: !36)
!54 = !DILocation(line: 51, column: 9, scope: !36)
!55 = !DILocation(line: 53, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_04_good", scope: !15, file: !15, line: 116, type: !16, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 118, column: 5, scope: !56)
!58 = !DILocation(line: 119, column: 5, scope: !56)
!59 = !DILocation(line: 120, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 132, type: !61, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 132, type: !63)
!66 = !DILocation(line: 132, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 132, type: !64)
!68 = !DILocation(line: 132, column: 27, scope: !60)
!69 = !DILocation(line: 135, column: 22, scope: !60)
!70 = !DILocation(line: 135, column: 12, scope: !60)
!71 = !DILocation(line: 135, column: 5, scope: !60)
!72 = !DILocation(line: 137, column: 5, scope: !60)
!73 = !DILocation(line: 138, column: 5, scope: !60)
!74 = !DILocation(line: 139, column: 5, scope: !60)
!75 = !DILocation(line: 142, column: 5, scope: !60)
!76 = !DILocation(line: 143, column: 5, scope: !60)
!77 = !DILocation(line: 144, column: 5, scope: !60)
!78 = !DILocation(line: 146, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 62, type: !4)
!81 = !DILocation(line: 62, column: 12, scope: !79)
!82 = !DILocation(line: 63, column: 10, scope: !79)
!83 = !DILocation(line: 72, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !85, file: !15, line: 70, column: 5)
!85 = distinct !DILexicalBlock(scope: !79, file: !15, line: 64, column: 8)
!86 = !DILocation(line: 72, column: 14, scope: !84)
!87 = !DILocation(line: 73, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 73, column: 13)
!89 = !DILocation(line: 73, column: 18, scope: !88)
!90 = !DILocation(line: 73, column: 13, scope: !84)
!91 = !DILocation(line: 73, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 73, column: 27)
!93 = !DILocation(line: 74, column: 16, scope: !84)
!94 = !DILocation(line: 74, column: 9, scope: !84)
!95 = !DILocation(line: 75, column: 9, scope: !84)
!96 = !DILocation(line: 75, column: 21, scope: !84)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !15, line: 78, type: !37)
!98 = distinct !DILexicalBlock(scope: !79, file: !15, line: 77, column: 5)
!99 = !DILocation(line: 78, column: 14, scope: !98)
!100 = !DILocation(line: 79, column: 9, scope: !98)
!101 = !DILocation(line: 80, column: 9, scope: !98)
!102 = !DILocation(line: 80, column: 21, scope: !98)
!103 = !DILocation(line: 83, column: 9, scope: !98)
!104 = !DILocation(line: 83, column: 22, scope: !98)
!105 = !DILocation(line: 83, column: 35, scope: !98)
!106 = !DILocation(line: 83, column: 28, scope: !98)
!107 = !DILocation(line: 83, column: 40, scope: !98)
!108 = !DILocation(line: 84, column: 9, scope: !98)
!109 = !DILocation(line: 84, column: 21, scope: !98)
!110 = !DILocation(line: 85, column: 19, scope: !98)
!111 = !DILocation(line: 85, column: 9, scope: !98)
!112 = !DILocation(line: 86, column: 14, scope: !98)
!113 = !DILocation(line: 86, column: 9, scope: !98)
!114 = !DILocation(line: 88, column: 1, scope: !79)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 91, type: !16, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 93, type: !4)
!117 = !DILocation(line: 93, column: 12, scope: !115)
!118 = !DILocation(line: 94, column: 10, scope: !115)
!119 = !DILocation(line: 98, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !15, line: 96, column: 5)
!121 = distinct !DILexicalBlock(scope: !115, file: !15, line: 95, column: 8)
!122 = !DILocation(line: 98, column: 14, scope: !120)
!123 = !DILocation(line: 99, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 99, column: 13)
!125 = !DILocation(line: 99, column: 18, scope: !124)
!126 = !DILocation(line: 99, column: 13, scope: !120)
!127 = !DILocation(line: 99, column: 28, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 99, column: 27)
!129 = !DILocation(line: 100, column: 16, scope: !120)
!130 = !DILocation(line: 100, column: 9, scope: !120)
!131 = !DILocation(line: 101, column: 9, scope: !120)
!132 = !DILocation(line: 101, column: 21, scope: !120)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !15, line: 104, type: !37)
!134 = distinct !DILexicalBlock(scope: !115, file: !15, line: 103, column: 5)
!135 = !DILocation(line: 104, column: 14, scope: !134)
!136 = !DILocation(line: 105, column: 9, scope: !134)
!137 = !DILocation(line: 106, column: 9, scope: !134)
!138 = !DILocation(line: 106, column: 21, scope: !134)
!139 = !DILocation(line: 109, column: 9, scope: !134)
!140 = !DILocation(line: 109, column: 22, scope: !134)
!141 = !DILocation(line: 109, column: 35, scope: !134)
!142 = !DILocation(line: 109, column: 28, scope: !134)
!143 = !DILocation(line: 109, column: 40, scope: !134)
!144 = !DILocation(line: 110, column: 9, scope: !134)
!145 = !DILocation(line: 110, column: 21, scope: !134)
!146 = !DILocation(line: 111, column: 19, scope: !134)
!147 = !DILocation(line: 111, column: 9, scope: !134)
!148 = !DILocation(line: 112, column: 14, scope: !134)
!149 = !DILocation(line: 112, column: 9, scope: !134)
!150 = !DILocation(line: 114, column: 1, scope: !115)
