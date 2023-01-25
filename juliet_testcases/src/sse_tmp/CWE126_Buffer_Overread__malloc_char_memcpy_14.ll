; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %cmp1 = icmp eq i8* %1, null, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !51
  %mul = mul i64 %call7, 1, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 %mul, i1 false), !dbg !48
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx8, align 1, !dbg !54
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay9), !dbg !56
  %5 = load i8*, i8** %data, align 8, !dbg !57
  call void @free(i8* %5) #8, !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_14_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #8, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #8, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_14_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_14_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* null, i8** %data, align 8, !dbg !86
  %0 = load i32, i32* @globalFive, align 4, !dbg !87
  %cmp = icmp ne i32 %0, 5, !dbg !89
  br i1 %cmp, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end3, !dbg !93

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !94
  store i8* %call, i8** %data, align 8, !dbg !96
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %cmp1 = icmp eq i8* %1, null, !dbg !99
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !110
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx4, align 1, !dbg !112
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !116
  %mul = mul i64 %call7, 1, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 %mul, i1 false), !dbg !113
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx8, align 1, !dbg !119
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  call void @printLine(i8* %arraydecay9), !dbg !121
  %5 = load i8*, i8** %data, align 8, !dbg !122
  call void @free(i8* %5) #8, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i8* null, i8** %data, align 8, !dbg !128
  %0 = load i32, i32* @globalFive, align 4, !dbg !129
  %cmp = icmp eq i32 %0, 5, !dbg !131
  br i1 %cmp, label %if.then, label %if.end3, !dbg !132

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !133
  store i8* %call, i8** %data, align 8, !dbg !135
  %1 = load i8*, i8** %data, align 8, !dbg !136
  %cmp1 = icmp eq i8* %1, null, !dbg !138
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !139

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !143
  %3 = load i8*, i8** %data, align 8, !dbg !144
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !144
  store i8 0, i8* %arrayidx, align 1, !dbg !145
  br label %if.end3, !dbg !146

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !147, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !150
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !151
  store i8 0, i8* %arrayidx4, align 1, !dbg !152
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  %4 = load i8*, i8** %data, align 8, !dbg !154
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !155
  %call7 = call i64 @strlen(i8* %arraydecay6) #10, !dbg !156
  %mul = mul i64 %call7, 1, !dbg !157
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay5, i8* align 1 %4, i64 %mul, i1 false), !dbg !153
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !158
  store i8 0, i8* %arrayidx8, align 1, !dbg !159
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !160
  call void @printLine(i8* %arraydecay9), !dbg !161
  %5 = load i8*, i8** %data, align 8, !dbg !162
  call void @free(i8* %5) #8, !dbg !163
  ret void, !dbg !164
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_14_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 18, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 14, scope: !26)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 18, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !26)
!32 = !DILocation(line: 31, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 31, column: 27)
!34 = !DILocation(line: 32, column: 16, scope: !26)
!35 = !DILocation(line: 32, column: 9, scope: !26)
!36 = !DILocation(line: 33, column: 9, scope: !26)
!37 = !DILocation(line: 33, column: 20, scope: !26)
!38 = !DILocation(line: 34, column: 5, scope: !26)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !15, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 36, column: 14, scope: !40)
!45 = !DILocation(line: 37, column: 9, scope: !40)
!46 = !DILocation(line: 38, column: 9, scope: !40)
!47 = !DILocation(line: 38, column: 21, scope: !40)
!48 = !DILocation(line: 41, column: 9, scope: !40)
!49 = !DILocation(line: 41, column: 22, scope: !40)
!50 = !DILocation(line: 41, column: 35, scope: !40)
!51 = !DILocation(line: 41, column: 28, scope: !40)
!52 = !DILocation(line: 41, column: 40, scope: !40)
!53 = !DILocation(line: 42, column: 9, scope: !40)
!54 = !DILocation(line: 42, column: 21, scope: !40)
!55 = !DILocation(line: 43, column: 19, scope: !40)
!56 = !DILocation(line: 43, column: 9, scope: !40)
!57 = !DILocation(line: 44, column: 14, scope: !40)
!58 = !DILocation(line: 44, column: 9, scope: !40)
!59 = !DILocation(line: 46, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_14_good", scope: !15, file: !15, line: 109, type: !16, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 111, column: 5, scope: !60)
!62 = !DILocation(line: 112, column: 5, scope: !60)
!63 = !DILocation(line: 113, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 125, type: !65, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !15, line: 125, type: !67)
!70 = !DILocation(line: 125, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !15, line: 125, type: !68)
!72 = !DILocation(line: 125, column: 27, scope: !64)
!73 = !DILocation(line: 128, column: 22, scope: !64)
!74 = !DILocation(line: 128, column: 12, scope: !64)
!75 = !DILocation(line: 128, column: 5, scope: !64)
!76 = !DILocation(line: 130, column: 5, scope: !64)
!77 = !DILocation(line: 131, column: 5, scope: !64)
!78 = !DILocation(line: 132, column: 5, scope: !64)
!79 = !DILocation(line: 135, column: 5, scope: !64)
!80 = !DILocation(line: 136, column: 5, scope: !64)
!81 = !DILocation(line: 137, column: 5, scope: !64)
!82 = !DILocation(line: 139, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !15, line: 55, type: !4)
!85 = !DILocation(line: 55, column: 12, scope: !83)
!86 = !DILocation(line: 56, column: 10, scope: !83)
!87 = !DILocation(line: 57, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !15, line: 57, column: 8)
!89 = !DILocation(line: 57, column: 18, scope: !88)
!90 = !DILocation(line: 57, column: 8, scope: !83)
!91 = !DILocation(line: 60, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 58, column: 5)
!93 = !DILocation(line: 61, column: 5, scope: !92)
!94 = !DILocation(line: 65, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !15, line: 63, column: 5)
!96 = !DILocation(line: 65, column: 14, scope: !95)
!97 = !DILocation(line: 66, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !15, line: 66, column: 13)
!99 = !DILocation(line: 66, column: 18, scope: !98)
!100 = !DILocation(line: 66, column: 13, scope: !95)
!101 = !DILocation(line: 66, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 66, column: 27)
!103 = !DILocation(line: 67, column: 16, scope: !95)
!104 = !DILocation(line: 67, column: 9, scope: !95)
!105 = !DILocation(line: 68, column: 9, scope: !95)
!106 = !DILocation(line: 68, column: 21, scope: !95)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !15, line: 71, type: !41)
!108 = distinct !DILexicalBlock(scope: !83, file: !15, line: 70, column: 5)
!109 = !DILocation(line: 71, column: 14, scope: !108)
!110 = !DILocation(line: 72, column: 9, scope: !108)
!111 = !DILocation(line: 73, column: 9, scope: !108)
!112 = !DILocation(line: 73, column: 21, scope: !108)
!113 = !DILocation(line: 76, column: 9, scope: !108)
!114 = !DILocation(line: 76, column: 22, scope: !108)
!115 = !DILocation(line: 76, column: 35, scope: !108)
!116 = !DILocation(line: 76, column: 28, scope: !108)
!117 = !DILocation(line: 76, column: 40, scope: !108)
!118 = !DILocation(line: 77, column: 9, scope: !108)
!119 = !DILocation(line: 77, column: 21, scope: !108)
!120 = !DILocation(line: 78, column: 19, scope: !108)
!121 = !DILocation(line: 78, column: 9, scope: !108)
!122 = !DILocation(line: 79, column: 14, scope: !108)
!123 = !DILocation(line: 79, column: 9, scope: !108)
!124 = !DILocation(line: 81, column: 1, scope: !83)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !15, line: 86, type: !4)
!127 = !DILocation(line: 86, column: 12, scope: !125)
!128 = !DILocation(line: 87, column: 10, scope: !125)
!129 = !DILocation(line: 88, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !15, line: 88, column: 8)
!131 = !DILocation(line: 88, column: 18, scope: !130)
!132 = !DILocation(line: 88, column: 8, scope: !125)
!133 = !DILocation(line: 91, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 89, column: 5)
!135 = !DILocation(line: 91, column: 14, scope: !134)
!136 = !DILocation(line: 92, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !15, line: 92, column: 13)
!138 = !DILocation(line: 92, column: 18, scope: !137)
!139 = !DILocation(line: 92, column: 13, scope: !134)
!140 = !DILocation(line: 92, column: 28, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !15, line: 92, column: 27)
!142 = !DILocation(line: 93, column: 16, scope: !134)
!143 = !DILocation(line: 93, column: 9, scope: !134)
!144 = !DILocation(line: 94, column: 9, scope: !134)
!145 = !DILocation(line: 94, column: 21, scope: !134)
!146 = !DILocation(line: 95, column: 5, scope: !134)
!147 = !DILocalVariable(name: "dest", scope: !148, file: !15, line: 97, type: !41)
!148 = distinct !DILexicalBlock(scope: !125, file: !15, line: 96, column: 5)
!149 = !DILocation(line: 97, column: 14, scope: !148)
!150 = !DILocation(line: 98, column: 9, scope: !148)
!151 = !DILocation(line: 99, column: 9, scope: !148)
!152 = !DILocation(line: 99, column: 21, scope: !148)
!153 = !DILocation(line: 102, column: 9, scope: !148)
!154 = !DILocation(line: 102, column: 22, scope: !148)
!155 = !DILocation(line: 102, column: 35, scope: !148)
!156 = !DILocation(line: 102, column: 28, scope: !148)
!157 = !DILocation(line: 102, column: 40, scope: !148)
!158 = !DILocation(line: 103, column: 9, scope: !148)
!159 = !DILocation(line: 103, column: 21, scope: !148)
!160 = !DILocation(line: 104, column: 19, scope: !148)
!161 = !DILocation(line: 104, column: 9, scope: !148)
!162 = !DILocation(line: 105, column: 14, scope: !148)
!163 = !DILocation(line: 105, column: 9, scope: !148)
!164 = !DILocation(line: 107, column: 1, scope: !125)
