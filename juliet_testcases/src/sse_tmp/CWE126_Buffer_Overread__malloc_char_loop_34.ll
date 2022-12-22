; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType* %myUnion to i8**, !dbg !41
  store i8* %3, i8** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType* %myUnion to i8**, !dbg !46
  %4 = load i8*, i8** %unionSecond, align 8, !dbg !46
  store i8* %4, i8** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !60
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx2, align 1, !dbg !62
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !63
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !64
  store i64 %call4, i64* %destLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !69
  %6 = load i64, i64* %destLen, align 8, !dbg !71
  %cmp5 = icmp ult i64 %5, %6, !dbg !72
  br i1 %cmp5, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data1, align 8, !dbg !74
  %8 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !74
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !74
  %10 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !78
  store i8 %9, i8* %arrayidx7, align 1, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %11, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx8, align 1, !dbg !87
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !88
  call void @printLine(i8* %arraydecay9), !dbg !89
  %12 = load i8*, i8** %data1, align 8, !dbg !90
  call void @free(i8* %12) #7, !dbg !91
  ret void, !dbg !92
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_34_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #7, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #7, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__malloc_char_loop_34_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__malloc_char_loop_34_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType* %myUnion, metadata !118, metadata !DIExpression()), !dbg !119
  store i8* null, i8** %data, align 8, !dbg !120
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !121
  store i8* %call, i8** %data, align 8, !dbg !122
  %0 = load i8*, i8** %data, align 8, !dbg !123
  %cmp = icmp eq i8* %0, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !130
  %2 = load i8*, i8** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  %3 = load i8*, i8** %data, align 8, !dbg !133
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType* %myUnion to i8**, !dbg !134
  store i8* %3, i8** %unionFirst, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !136, metadata !DIExpression()), !dbg !138
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__malloc_char_loop_34_unionType* %myUnion to i8**, !dbg !139
  %4 = load i8*, i8** %unionSecond, align 8, !dbg !139
  store i8* %4, i8** %data1, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !147
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx2, align 1, !dbg !149
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !151
  store i64 %call4, i64* %destLen, align 8, !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !156
  %6 = load i64, i64* %destLen, align 8, !dbg !158
  %cmp5 = icmp ult i64 %5, %6, !dbg !159
  br i1 %cmp5, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data1, align 8, !dbg !161
  %8 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !161
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !161
  %10 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !165
  store i8 %9, i8* %arrayidx7, align 1, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %11, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !172
  store i8 0, i8* %arrayidx8, align 1, !dbg !173
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !174
  call void @printLine(i8* %arraydecay9), !dbg !175
  %12 = load i8*, i8** %data1, align 8, !dbg !176
  call void @free(i8* %12) #7, !dbg !177
  ret void, !dbg !178
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_34.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_34.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !4)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__malloc_char_loop_34_unionType", file: !15, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !15, line: 23, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !15, line: 24, baseType: !4, size: 64)
!26 = !DILocation(line: 32, column: 59, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocation(line: 35, column: 20, scope: !14)
!29 = !DILocation(line: 35, column: 10, scope: !14)
!30 = !DILocation(line: 36, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 9)
!32 = !DILocation(line: 36, column: 14, scope: !31)
!33 = !DILocation(line: 36, column: 9, scope: !14)
!34 = !DILocation(line: 36, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 36, column: 23)
!36 = !DILocation(line: 37, column: 12, scope: !14)
!37 = !DILocation(line: 37, column: 5, scope: !14)
!38 = !DILocation(line: 38, column: 5, scope: !14)
!39 = !DILocation(line: 38, column: 16, scope: !14)
!40 = !DILocation(line: 39, column: 26, scope: !14)
!41 = !DILocation(line: 39, column: 13, scope: !14)
!42 = !DILocation(line: 39, column: 24, scope: !14)
!43 = !DILocalVariable(name: "data", scope: !44, file: !15, line: 41, type: !4)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!45 = !DILocation(line: 41, column: 16, scope: !44)
!46 = !DILocation(line: 41, column: 31, scope: !44)
!47 = !DILocalVariable(name: "i", scope: !48, file: !15, line: 43, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !15, line: 42, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 43, column: 20, scope: !48)
!53 = !DILocalVariable(name: "destLen", scope: !48, file: !15, line: 43, type: !49)
!54 = !DILocation(line: 43, column: 23, scope: !48)
!55 = !DILocalVariable(name: "dest", scope: !48, file: !15, line: 44, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 44, column: 18, scope: !48)
!60 = !DILocation(line: 45, column: 13, scope: !48)
!61 = !DILocation(line: 46, column: 13, scope: !48)
!62 = !DILocation(line: 46, column: 25, scope: !48)
!63 = !DILocation(line: 47, column: 30, scope: !48)
!64 = !DILocation(line: 47, column: 23, scope: !48)
!65 = !DILocation(line: 47, column: 21, scope: !48)
!66 = !DILocation(line: 50, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !48, file: !15, line: 50, column: 13)
!68 = !DILocation(line: 50, column: 18, scope: !67)
!69 = !DILocation(line: 50, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !15, line: 50, column: 13)
!71 = !DILocation(line: 50, column: 29, scope: !70)
!72 = !DILocation(line: 50, column: 27, scope: !70)
!73 = !DILocation(line: 50, column: 13, scope: !67)
!74 = !DILocation(line: 52, column: 27, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !15, line: 51, column: 13)
!76 = !DILocation(line: 52, column: 32, scope: !75)
!77 = !DILocation(line: 52, column: 22, scope: !75)
!78 = !DILocation(line: 52, column: 17, scope: !75)
!79 = !DILocation(line: 52, column: 25, scope: !75)
!80 = !DILocation(line: 53, column: 13, scope: !75)
!81 = !DILocation(line: 50, column: 39, scope: !70)
!82 = !DILocation(line: 50, column: 13, scope: !70)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 53, column: 13, scope: !67)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 54, column: 13, scope: !48)
!87 = !DILocation(line: 54, column: 25, scope: !48)
!88 = !DILocation(line: 55, column: 23, scope: !48)
!89 = !DILocation(line: 55, column: 13, scope: !48)
!90 = !DILocation(line: 56, column: 18, scope: !48)
!91 = !DILocation(line: 56, column: 13, scope: !48)
!92 = !DILocation(line: 59, column: 1, scope: !14)
!93 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_34_good", scope: !15, file: !15, line: 98, type: !16, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 100, column: 5, scope: !93)
!95 = !DILocation(line: 101, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 112, type: !97, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!99, !99, !100}
!99 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !15, line: 112, type: !99)
!102 = !DILocation(line: 112, column: 14, scope: !96)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !15, line: 112, type: !100)
!104 = !DILocation(line: 112, column: 27, scope: !96)
!105 = !DILocation(line: 115, column: 22, scope: !96)
!106 = !DILocation(line: 115, column: 12, scope: !96)
!107 = !DILocation(line: 115, column: 5, scope: !96)
!108 = !DILocation(line: 117, column: 5, scope: !96)
!109 = !DILocation(line: 118, column: 5, scope: !96)
!110 = !DILocation(line: 119, column: 5, scope: !96)
!111 = !DILocation(line: 122, column: 5, scope: !96)
!112 = !DILocation(line: 123, column: 5, scope: !96)
!113 = !DILocation(line: 124, column: 5, scope: !96)
!114 = !DILocation(line: 126, column: 5, scope: !96)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 68, type: !4)
!117 = !DILocation(line: 68, column: 12, scope: !115)
!118 = !DILocalVariable(name: "myUnion", scope: !115, file: !15, line: 69, type: !21)
!119 = !DILocation(line: 69, column: 59, scope: !115)
!120 = !DILocation(line: 70, column: 10, scope: !115)
!121 = !DILocation(line: 72, column: 20, scope: !115)
!122 = !DILocation(line: 72, column: 10, scope: !115)
!123 = !DILocation(line: 73, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !115, file: !15, line: 73, column: 9)
!125 = !DILocation(line: 73, column: 14, scope: !124)
!126 = !DILocation(line: 73, column: 9, scope: !115)
!127 = !DILocation(line: 73, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 73, column: 23)
!129 = !DILocation(line: 74, column: 12, scope: !115)
!130 = !DILocation(line: 74, column: 5, scope: !115)
!131 = !DILocation(line: 75, column: 5, scope: !115)
!132 = !DILocation(line: 75, column: 17, scope: !115)
!133 = !DILocation(line: 76, column: 26, scope: !115)
!134 = !DILocation(line: 76, column: 13, scope: !115)
!135 = !DILocation(line: 76, column: 24, scope: !115)
!136 = !DILocalVariable(name: "data", scope: !137, file: !15, line: 78, type: !4)
!137 = distinct !DILexicalBlock(scope: !115, file: !15, line: 77, column: 5)
!138 = !DILocation(line: 78, column: 16, scope: !137)
!139 = !DILocation(line: 78, column: 31, scope: !137)
!140 = !DILocalVariable(name: "i", scope: !141, file: !15, line: 80, type: !49)
!141 = distinct !DILexicalBlock(scope: !137, file: !15, line: 79, column: 9)
!142 = !DILocation(line: 80, column: 20, scope: !141)
!143 = !DILocalVariable(name: "destLen", scope: !141, file: !15, line: 80, type: !49)
!144 = !DILocation(line: 80, column: 23, scope: !141)
!145 = !DILocalVariable(name: "dest", scope: !141, file: !15, line: 81, type: !56)
!146 = !DILocation(line: 81, column: 18, scope: !141)
!147 = !DILocation(line: 82, column: 13, scope: !141)
!148 = !DILocation(line: 83, column: 13, scope: !141)
!149 = !DILocation(line: 83, column: 25, scope: !141)
!150 = !DILocation(line: 84, column: 30, scope: !141)
!151 = !DILocation(line: 84, column: 23, scope: !141)
!152 = !DILocation(line: 84, column: 21, scope: !141)
!153 = !DILocation(line: 87, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !141, file: !15, line: 87, column: 13)
!155 = !DILocation(line: 87, column: 18, scope: !154)
!156 = !DILocation(line: 87, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !15, line: 87, column: 13)
!158 = !DILocation(line: 87, column: 29, scope: !157)
!159 = !DILocation(line: 87, column: 27, scope: !157)
!160 = !DILocation(line: 87, column: 13, scope: !154)
!161 = !DILocation(line: 89, column: 27, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !15, line: 88, column: 13)
!163 = !DILocation(line: 89, column: 32, scope: !162)
!164 = !DILocation(line: 89, column: 22, scope: !162)
!165 = !DILocation(line: 89, column: 17, scope: !162)
!166 = !DILocation(line: 89, column: 25, scope: !162)
!167 = !DILocation(line: 90, column: 13, scope: !162)
!168 = !DILocation(line: 87, column: 39, scope: !157)
!169 = !DILocation(line: 87, column: 13, scope: !157)
!170 = distinct !{!170, !160, !171, !85}
!171 = !DILocation(line: 90, column: 13, scope: !154)
!172 = !DILocation(line: 91, column: 13, scope: !141)
!173 = !DILocation(line: 91, column: 25, scope: !141)
!174 = !DILocation(line: 92, column: 23, scope: !141)
!175 = !DILocation(line: 92, column: 13, scope: !141)
!176 = !DILocation(line: 93, column: 18, scope: !141)
!177 = !DILocation(line: 93, column: 13, scope: !141)
!178 = !DILocation(line: 96, column: 1, scope: !115)
