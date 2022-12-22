; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  call void %3(i8* %4), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !52, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx, align 1, !dbg !59
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %call = call i64 @strlen(i8* %arraydecay1) #9, !dbg !61
  store i64 %call, i64* %destLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !66
  %1 = load i64, i64* %destLen, align 8, !dbg !68
  %cmp = icmp ult i64 %0, %1, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !71
  %3 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !71
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !71
  %5 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !75
  store i8 %4, i8* %arrayidx3, align 1, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %6, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx4, align 1, !dbg !84
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  call void @printLine(i8* %arraydecay5), !dbg !86
  %7 = load i8*, i8** %data.addr, align 8, !dbg !87
  call void @free(i8* %7) #7, !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_44_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #7, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #7, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__malloc_char_loop_44_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__malloc_char_loop_44_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !115, metadata !DIExpression()), !dbg !116
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !116
  store i8* null, i8** %data, align 8, !dbg !117
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !118
  store i8* %call, i8** %data, align 8, !dbg !119
  %0 = load i8*, i8** %data, align 8, !dbg !120
  %cmp = icmp eq i8* %0, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !127
  %2 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !130
  %4 = load i8*, i8** %data, align 8, !dbg !131
  call void %3(i8* %4), !dbg !130
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !133 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !143
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !144
  store i8 0, i8* %arrayidx, align 1, !dbg !145
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !146
  %call = call i64 @strlen(i8* %arraydecay1) #9, !dbg !147
  store i64 %call, i64* %destLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !152
  %1 = load i64, i64* %destLen, align 8, !dbg !154
  %cmp = icmp ult i64 %0, %1, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !157
  %3 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !157
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !157
  %5 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !161
  store i8 %4, i8* %arrayidx3, align 1, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %6, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !168
  store i8 0, i8* %arrayidx4, align 1, !dbg !169
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !170
  call void @printLine(i8* %arraydecay5), !dbg !171
  %7 = load i8*, i8** %data.addr, align 8, !dbg !172
  call void @free(i8* %7) #7, !dbg !173
  ret void, !dbg !174
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_44.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_44_bad", scope: !15, file: !15, line: 43, type: !16, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_44.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 45, type: !4)
!19 = !DILocation(line: 45, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 47, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 47, column: 12, scope: !14)
!25 = !DILocation(line: 48, column: 10, scope: !14)
!26 = !DILocation(line: 50, column: 20, scope: !14)
!27 = !DILocation(line: 50, column: 10, scope: !14)
!28 = !DILocation(line: 51, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 51, column: 9)
!30 = !DILocation(line: 51, column: 14, scope: !29)
!31 = !DILocation(line: 51, column: 9, scope: !14)
!32 = !DILocation(line: 51, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 51, column: 23)
!34 = !DILocation(line: 52, column: 12, scope: !14)
!35 = !DILocation(line: 52, column: 5, scope: !14)
!36 = !DILocation(line: 53, column: 5, scope: !14)
!37 = !DILocation(line: 53, column: 16, scope: !14)
!38 = !DILocation(line: 55, column: 5, scope: !14)
!39 = !DILocation(line: 55, column: 13, scope: !14)
!40 = !DILocation(line: 56, column: 1, scope: !14)
!41 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !15, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 28, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !15, line: 26, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 25, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 26, column: 16, scope: !45)
!50 = !DILocalVariable(name: "destLen", scope: !45, file: !15, line: 26, type: !46)
!51 = !DILocation(line: 26, column: 19, scope: !45)
!52 = !DILocalVariable(name: "dest", scope: !45, file: !15, line: 27, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 27, column: 14, scope: !45)
!57 = !DILocation(line: 28, column: 9, scope: !45)
!58 = !DILocation(line: 29, column: 9, scope: !45)
!59 = !DILocation(line: 29, column: 21, scope: !45)
!60 = !DILocation(line: 30, column: 26, scope: !45)
!61 = !DILocation(line: 30, column: 19, scope: !45)
!62 = !DILocation(line: 30, column: 17, scope: !45)
!63 = !DILocation(line: 33, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !45, file: !15, line: 33, column: 9)
!65 = !DILocation(line: 33, column: 14, scope: !64)
!66 = !DILocation(line: 33, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 33, column: 9)
!68 = !DILocation(line: 33, column: 25, scope: !67)
!69 = !DILocation(line: 33, column: 23, scope: !67)
!70 = !DILocation(line: 33, column: 9, scope: !64)
!71 = !DILocation(line: 35, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !15, line: 34, column: 9)
!73 = !DILocation(line: 35, column: 28, scope: !72)
!74 = !DILocation(line: 35, column: 18, scope: !72)
!75 = !DILocation(line: 35, column: 13, scope: !72)
!76 = !DILocation(line: 35, column: 21, scope: !72)
!77 = !DILocation(line: 36, column: 9, scope: !72)
!78 = !DILocation(line: 33, column: 35, scope: !67)
!79 = !DILocation(line: 33, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 36, column: 9, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 37, column: 9, scope: !45)
!84 = !DILocation(line: 37, column: 21, scope: !45)
!85 = !DILocation(line: 38, column: 19, scope: !45)
!86 = !DILocation(line: 38, column: 9, scope: !45)
!87 = !DILocation(line: 39, column: 14, scope: !45)
!88 = !DILocation(line: 39, column: 9, scope: !45)
!89 = !DILocation(line: 41, column: 1, scope: !41)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_44_good", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 98, column: 5, scope: !90)
!92 = !DILocation(line: 99, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !94, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!96, !96, !97}
!96 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !15, line: 110, type: !96)
!99 = !DILocation(line: 110, column: 14, scope: !93)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !15, line: 110, type: !97)
!101 = !DILocation(line: 110, column: 27, scope: !93)
!102 = !DILocation(line: 113, column: 22, scope: !93)
!103 = !DILocation(line: 113, column: 12, scope: !93)
!104 = !DILocation(line: 113, column: 5, scope: !93)
!105 = !DILocation(line: 115, column: 5, scope: !93)
!106 = !DILocation(line: 116, column: 5, scope: !93)
!107 = !DILocation(line: 117, column: 5, scope: !93)
!108 = !DILocation(line: 120, column: 5, scope: !93)
!109 = !DILocation(line: 121, column: 5, scope: !93)
!110 = !DILocation(line: 122, column: 5, scope: !93)
!111 = !DILocation(line: 124, column: 5, scope: !93)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 83, type: !16, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 85, type: !4)
!114 = !DILocation(line: 85, column: 12, scope: !112)
!115 = !DILocalVariable(name: "funcPtr", scope: !112, file: !15, line: 86, type: !21)
!116 = !DILocation(line: 86, column: 12, scope: !112)
!117 = !DILocation(line: 87, column: 10, scope: !112)
!118 = !DILocation(line: 89, column: 20, scope: !112)
!119 = !DILocation(line: 89, column: 10, scope: !112)
!120 = !DILocation(line: 90, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !112, file: !15, line: 90, column: 9)
!122 = !DILocation(line: 90, column: 14, scope: !121)
!123 = !DILocation(line: 90, column: 9, scope: !112)
!124 = !DILocation(line: 90, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 90, column: 23)
!126 = !DILocation(line: 91, column: 12, scope: !112)
!127 = !DILocation(line: 91, column: 5, scope: !112)
!128 = !DILocation(line: 92, column: 5, scope: !112)
!129 = !DILocation(line: 92, column: 17, scope: !112)
!130 = !DILocation(line: 93, column: 5, scope: !112)
!131 = !DILocation(line: 93, column: 13, scope: !112)
!132 = !DILocation(line: 94, column: 1, scope: !112)
!133 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 63, type: !22, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", arg: 1, scope: !133, file: !15, line: 63, type: !4)
!135 = !DILocation(line: 63, column: 32, scope: !133)
!136 = !DILocalVariable(name: "i", scope: !137, file: !15, line: 66, type: !46)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 65, column: 5)
!138 = !DILocation(line: 66, column: 16, scope: !137)
!139 = !DILocalVariable(name: "destLen", scope: !137, file: !15, line: 66, type: !46)
!140 = !DILocation(line: 66, column: 19, scope: !137)
!141 = !DILocalVariable(name: "dest", scope: !137, file: !15, line: 67, type: !53)
!142 = !DILocation(line: 67, column: 14, scope: !137)
!143 = !DILocation(line: 68, column: 9, scope: !137)
!144 = !DILocation(line: 69, column: 9, scope: !137)
!145 = !DILocation(line: 69, column: 21, scope: !137)
!146 = !DILocation(line: 70, column: 26, scope: !137)
!147 = !DILocation(line: 70, column: 19, scope: !137)
!148 = !DILocation(line: 70, column: 17, scope: !137)
!149 = !DILocation(line: 73, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !137, file: !15, line: 73, column: 9)
!151 = !DILocation(line: 73, column: 14, scope: !150)
!152 = !DILocation(line: 73, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !15, line: 73, column: 9)
!154 = !DILocation(line: 73, column: 25, scope: !153)
!155 = !DILocation(line: 73, column: 23, scope: !153)
!156 = !DILocation(line: 73, column: 9, scope: !150)
!157 = !DILocation(line: 75, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !15, line: 74, column: 9)
!159 = !DILocation(line: 75, column: 28, scope: !158)
!160 = !DILocation(line: 75, column: 18, scope: !158)
!161 = !DILocation(line: 75, column: 13, scope: !158)
!162 = !DILocation(line: 75, column: 21, scope: !158)
!163 = !DILocation(line: 76, column: 9, scope: !158)
!164 = !DILocation(line: 73, column: 35, scope: !153)
!165 = !DILocation(line: 73, column: 9, scope: !153)
!166 = distinct !{!166, !156, !167, !82}
!167 = !DILocation(line: 76, column: 9, scope: !150)
!168 = !DILocation(line: 77, column: 9, scope: !137)
!169 = !DILocation(line: 77, column: 21, scope: !137)
!170 = !DILocation(line: 78, column: 19, scope: !137)
!171 = !DILocation(line: 78, column: 9, scope: !137)
!172 = !DILocation(line: 79, column: 14, scope: !137)
!173 = !DILocation(line: 79, column: 9, scope: !137)
!174 = !DILocation(line: 81, column: 1, scope: !133)
