; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_10.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !28
  store i8* %call, i8** %dataBuffer, align 8, !dbg !27
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %cmp = icmp eq i8* %1, null, !dbg !31
  br i1 %cmp, label %if.then1, label %if.end, !dbg !32

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !36
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !40
  store i8* %add.ptr, i8** %data, align 8, !dbg !41
  br label %if.end2, !dbg !42

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx3, align 1, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %5 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !55
  %call7 = call i8* @strncpy(i8* %arraydecay4, i8* %5, i64 %call6) #7, !dbg !56
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx8, align 1, !dbg !58
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @printLine(i8* %arraydecay9), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_10_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #7, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #7, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_10_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__malloc_char_ncpy_10_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %0 = load i32, i32* @globalFalse, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end2, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !99
  store i8* %call, i8** %dataBuffer, align 8, !dbg !98
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  %cmp = icmp eq i8* %1, null, !dbg !102
  br i1 %cmp, label %if.then1, label %if.end, !dbg !103

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !107
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  store i8* %4, i8** %data, align 8, !dbg !111
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx3, align 1, !dbg !117
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  %5 = load i8*, i8** %data, align 8, !dbg !119
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !121
  %call7 = call i8* @strncpy(i8* %arraydecay4, i8* %5, i64 %call6) #7, !dbg !122
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx8, align 1, !dbg !124
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @printLine(i8* %arraydecay9), !dbg !126
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !129, metadata !DIExpression()), !dbg !130
  store i8* null, i8** %data, align 8, !dbg !131
  %0 = load i32, i32* @globalTrue, align 4, !dbg !132
  %tobool = icmp ne i32 %0, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.end2, !dbg !134

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !135, metadata !DIExpression()), !dbg !138
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !139
  store i8* %call, i8** %dataBuffer, align 8, !dbg !138
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !140
  %cmp = icmp eq i8* %1, null, !dbg !142
  br i1 %cmp, label %if.then1, label %if.end, !dbg !143

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !147
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !150
  store i8* %4, i8** %data, align 8, !dbg !151
  br label %if.end2, !dbg !152

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !153, metadata !DIExpression()), !dbg !155
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !156
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx3, align 1, !dbg !158
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !159
  %5 = load i8*, i8** %data, align 8, !dbg !160
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !161
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !162
  %call7 = call i8* @strncpy(i8* %arraydecay4, i8* %5, i64 %call6) #7, !dbg !163
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !164
  store i8 0, i8* %arrayidx8, align 1, !dbg !165
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  call void @printLine(i8* %arraydecay9), !dbg !167
  ret void, !dbg !168
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_10_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_10.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 41, scope: !25)
!29 = !DILocation(line: 31, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 17)
!31 = !DILocation(line: 31, column: 28, scope: !30)
!32 = !DILocation(line: 31, column: 17, scope: !25)
!33 = !DILocation(line: 31, column: 38, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 31, column: 37)
!35 = !DILocation(line: 32, column: 20, scope: !25)
!36 = !DILocation(line: 32, column: 13, scope: !25)
!37 = !DILocation(line: 33, column: 13, scope: !25)
!38 = !DILocation(line: 33, column: 31, scope: !25)
!39 = !DILocation(line: 35, column: 20, scope: !25)
!40 = !DILocation(line: 35, column: 31, scope: !25)
!41 = !DILocation(line: 35, column: 18, scope: !25)
!42 = !DILocation(line: 37, column: 5, scope: !26)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 39, column: 14, scope: !44)
!49 = !DILocation(line: 40, column: 9, scope: !44)
!50 = !DILocation(line: 41, column: 9, scope: !44)
!51 = !DILocation(line: 41, column: 21, scope: !44)
!52 = !DILocation(line: 43, column: 17, scope: !44)
!53 = !DILocation(line: 43, column: 23, scope: !44)
!54 = !DILocation(line: 43, column: 36, scope: !44)
!55 = !DILocation(line: 43, column: 29, scope: !44)
!56 = !DILocation(line: 43, column: 9, scope: !44)
!57 = !DILocation(line: 45, column: 9, scope: !44)
!58 = !DILocation(line: 45, column: 21, scope: !44)
!59 = !DILocation(line: 46, column: 19, scope: !44)
!60 = !DILocation(line: 46, column: 9, scope: !44)
!61 = !DILocation(line: 50, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_10_good", scope: !15, file: !15, line: 121, type: !16, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 123, column: 5, scope: !62)
!64 = !DILocation(line: 124, column: 5, scope: !62)
!65 = !DILocation(line: 125, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 137, type: !67, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 137, type: !69)
!72 = !DILocation(line: 137, column: 14, scope: !66)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 137, type: !70)
!74 = !DILocation(line: 137, column: 27, scope: !66)
!75 = !DILocation(line: 140, column: 22, scope: !66)
!76 = !DILocation(line: 140, column: 12, scope: !66)
!77 = !DILocation(line: 140, column: 5, scope: !66)
!78 = !DILocation(line: 142, column: 5, scope: !66)
!79 = !DILocation(line: 143, column: 5, scope: !66)
!80 = !DILocation(line: 144, column: 5, scope: !66)
!81 = !DILocation(line: 147, column: 5, scope: !66)
!82 = !DILocation(line: 148, column: 5, scope: !66)
!83 = !DILocation(line: 149, column: 5, scope: !66)
!84 = !DILocation(line: 151, column: 5, scope: !66)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 59, type: !4)
!87 = !DILocation(line: 59, column: 12, scope: !85)
!88 = !DILocation(line: 60, column: 10, scope: !85)
!89 = !DILocation(line: 61, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !15, line: 61, column: 8)
!91 = !DILocation(line: 61, column: 8, scope: !85)
!92 = !DILocation(line: 64, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 62, column: 5)
!94 = !DILocation(line: 65, column: 5, scope: !93)
!95 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !15, line: 69, type: !4)
!96 = distinct !DILexicalBlock(scope: !97, file: !15, line: 68, column: 9)
!97 = distinct !DILexicalBlock(scope: !90, file: !15, line: 67, column: 5)
!98 = !DILocation(line: 69, column: 20, scope: !96)
!99 = !DILocation(line: 69, column: 41, scope: !96)
!100 = !DILocation(line: 70, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !15, line: 70, column: 17)
!102 = !DILocation(line: 70, column: 28, scope: !101)
!103 = !DILocation(line: 70, column: 17, scope: !96)
!104 = !DILocation(line: 70, column: 38, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 70, column: 37)
!106 = !DILocation(line: 71, column: 20, scope: !96)
!107 = !DILocation(line: 71, column: 13, scope: !96)
!108 = !DILocation(line: 72, column: 13, scope: !96)
!109 = !DILocation(line: 72, column: 31, scope: !96)
!110 = !DILocation(line: 74, column: 20, scope: !96)
!111 = !DILocation(line: 74, column: 18, scope: !96)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !15, line: 78, type: !45)
!113 = distinct !DILexicalBlock(scope: !85, file: !15, line: 77, column: 5)
!114 = !DILocation(line: 78, column: 14, scope: !113)
!115 = !DILocation(line: 79, column: 9, scope: !113)
!116 = !DILocation(line: 80, column: 9, scope: !113)
!117 = !DILocation(line: 80, column: 21, scope: !113)
!118 = !DILocation(line: 82, column: 17, scope: !113)
!119 = !DILocation(line: 82, column: 23, scope: !113)
!120 = !DILocation(line: 82, column: 36, scope: !113)
!121 = !DILocation(line: 82, column: 29, scope: !113)
!122 = !DILocation(line: 82, column: 9, scope: !113)
!123 = !DILocation(line: 84, column: 9, scope: !113)
!124 = !DILocation(line: 84, column: 21, scope: !113)
!125 = !DILocation(line: 85, column: 19, scope: !113)
!126 = !DILocation(line: 85, column: 9, scope: !113)
!127 = !DILocation(line: 89, column: 1, scope: !85)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", scope: !128, file: !15, line: 94, type: !4)
!130 = !DILocation(line: 94, column: 12, scope: !128)
!131 = !DILocation(line: 95, column: 10, scope: !128)
!132 = !DILocation(line: 96, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !15, line: 96, column: 8)
!134 = !DILocation(line: 96, column: 8, scope: !128)
!135 = !DILocalVariable(name: "dataBuffer", scope: !136, file: !15, line: 99, type: !4)
!136 = distinct !DILexicalBlock(scope: !137, file: !15, line: 98, column: 9)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 97, column: 5)
!138 = !DILocation(line: 99, column: 20, scope: !136)
!139 = !DILocation(line: 99, column: 41, scope: !136)
!140 = !DILocation(line: 100, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !15, line: 100, column: 17)
!142 = !DILocation(line: 100, column: 28, scope: !141)
!143 = !DILocation(line: 100, column: 17, scope: !136)
!144 = !DILocation(line: 100, column: 38, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !15, line: 100, column: 37)
!146 = !DILocation(line: 101, column: 20, scope: !136)
!147 = !DILocation(line: 101, column: 13, scope: !136)
!148 = !DILocation(line: 102, column: 13, scope: !136)
!149 = !DILocation(line: 102, column: 31, scope: !136)
!150 = !DILocation(line: 104, column: 20, scope: !136)
!151 = !DILocation(line: 104, column: 18, scope: !136)
!152 = !DILocation(line: 106, column: 5, scope: !137)
!153 = !DILocalVariable(name: "dest", scope: !154, file: !15, line: 108, type: !45)
!154 = distinct !DILexicalBlock(scope: !128, file: !15, line: 107, column: 5)
!155 = !DILocation(line: 108, column: 14, scope: !154)
!156 = !DILocation(line: 109, column: 9, scope: !154)
!157 = !DILocation(line: 110, column: 9, scope: !154)
!158 = !DILocation(line: 110, column: 21, scope: !154)
!159 = !DILocation(line: 112, column: 17, scope: !154)
!160 = !DILocation(line: 112, column: 23, scope: !154)
!161 = !DILocation(line: 112, column: 36, scope: !154)
!162 = !DILocation(line: 112, column: 29, scope: !154)
!163 = !DILocation(line: 112, column: 9, scope: !154)
!164 = !DILocation(line: 114, column: 9, scope: !154)
!165 = !DILocation(line: 114, column: 21, scope: !154)
!166 = !DILocation(line: 115, column: 19, scope: !154)
!167 = !DILocation(line: 115, column: 9, scope: !154)
!168 = !DILocation(line: 119, column: 1, scope: !128)
