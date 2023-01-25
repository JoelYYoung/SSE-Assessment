; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_45.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_char_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__malloc_char_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
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
  %3 = load i8*, i8** %data, align 8, !dbg !38
  store i8* %3, i8** @CWE126_Buffer_Overread__malloc_char_loop_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #7, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #7, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE126_Buffer_Overread__malloc_char_loop_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE126_Buffer_Overread__malloc_char_loop_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** @CWE126_Buffer_Overread__malloc_char_loop_45_badData, align 8, !dbg !67
  store i8* %0, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !76, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !81
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  %call = call i64 @strlen(i8* %arraydecay1) #9, !dbg !85
  store i64 %call, i64* %destLen, align 8, !dbg !86
  store i64 0, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !90
  %2 = load i64, i64* %destLen, align 8, !dbg !92
  %cmp = icmp ult i64 %1, %2, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !95
  %4 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !95
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !95
  %6 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !99
  store i8 %5, i8* %arrayidx3, align 1, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !102
  %inc = add i64 %7, 1, !dbg !102
  store i64 %inc, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay5), !dbg !110
  %8 = load i8*, i8** %data, align 8, !dbg !111
  call void @free(i8* %8) #7, !dbg !112
  ret void, !dbg !113
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
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
  %3 = load i8*, i8** %data, align 8, !dbg !130
  store i8* %3, i8** @CWE126_Buffer_Overread__malloc_char_loop_45_goodG2BData, align 8, !dbg !131
  call void @goodG2BSink(), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !134 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !135, metadata !DIExpression()), !dbg !136
  %0 = load i8*, i8** @CWE126_Buffer_Overread__malloc_char_loop_45_goodG2BData, align 8, !dbg !137
  store i8* %0, i8** %data, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !145
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  %call = call i64 @strlen(i8* %arraydecay1) #9, !dbg !149
  store i64 %call, i64* %destLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !154
  %2 = load i64, i64* %destLen, align 8, !dbg !156
  %cmp = icmp ult i64 %1, %2, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !159
  %4 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !159
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !159
  %6 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !163
  store i8 %5, i8* %arrayidx3, align 1, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %7, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !170
  store i8 0, i8* %arrayidx4, align 1, !dbg !171
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !172
  call void @printLine(i8* %arraydecay5), !dbg !173
  %8 = load i8*, i8** %data, align 8, !dbg !174
  call void @free(i8* %8) #7, !dbg !175
  ret void, !dbg !176
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_loop_45_badData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__malloc_char_loop_45_goodG2BData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_45_bad", scope: !13, file: !13, line: 47, type: !21, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 49, type: !6)
!24 = !DILocation(line: 49, column: 12, scope: !20)
!25 = !DILocation(line: 50, column: 10, scope: !20)
!26 = !DILocation(line: 52, column: 20, scope: !20)
!27 = !DILocation(line: 52, column: 10, scope: !20)
!28 = !DILocation(line: 53, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 53, column: 9)
!30 = !DILocation(line: 53, column: 14, scope: !29)
!31 = !DILocation(line: 53, column: 9, scope: !20)
!32 = !DILocation(line: 53, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 53, column: 23)
!34 = !DILocation(line: 54, column: 12, scope: !20)
!35 = !DILocation(line: 54, column: 5, scope: !20)
!36 = !DILocation(line: 55, column: 5, scope: !20)
!37 = !DILocation(line: 55, column: 16, scope: !20)
!38 = !DILocation(line: 56, column: 59, scope: !20)
!39 = !DILocation(line: 56, column: 57, scope: !20)
!40 = !DILocation(line: 57, column: 5, scope: !20)
!41 = !DILocation(line: 58, column: 1, scope: !20)
!42 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_45_good", scope: !13, file: !13, line: 99, type: !21, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 101, column: 5, scope: !42)
!44 = !DILocation(line: 102, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 113, type: !46, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !13, line: 113, type: !48)
!51 = !DILocation(line: 113, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !13, line: 113, type: !49)
!53 = !DILocation(line: 113, column: 27, scope: !45)
!54 = !DILocation(line: 116, column: 22, scope: !45)
!55 = !DILocation(line: 116, column: 12, scope: !45)
!56 = !DILocation(line: 116, column: 5, scope: !45)
!57 = !DILocation(line: 118, column: 5, scope: !45)
!58 = !DILocation(line: 119, column: 5, scope: !45)
!59 = !DILocation(line: 120, column: 5, scope: !45)
!60 = !DILocation(line: 123, column: 5, scope: !45)
!61 = !DILocation(line: 124, column: 5, scope: !45)
!62 = !DILocation(line: 125, column: 5, scope: !45)
!63 = !DILocation(line: 127, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !13, line: 28, type: !6)
!66 = !DILocation(line: 28, column: 12, scope: !64)
!67 = !DILocation(line: 28, column: 19, scope: !64)
!68 = !DILocalVariable(name: "i", scope: !69, file: !13, line: 30, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !13, line: 29, column: 5)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !71, line: 46, baseType: !72)
!71 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!72 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!73 = !DILocation(line: 30, column: 16, scope: !69)
!74 = !DILocalVariable(name: "destLen", scope: !69, file: !13, line: 30, type: !70)
!75 = !DILocation(line: 30, column: 19, scope: !69)
!76 = !DILocalVariable(name: "dest", scope: !69, file: !13, line: 31, type: !77)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 100)
!80 = !DILocation(line: 31, column: 14, scope: !69)
!81 = !DILocation(line: 32, column: 9, scope: !69)
!82 = !DILocation(line: 33, column: 9, scope: !69)
!83 = !DILocation(line: 33, column: 21, scope: !69)
!84 = !DILocation(line: 34, column: 26, scope: !69)
!85 = !DILocation(line: 34, column: 19, scope: !69)
!86 = !DILocation(line: 34, column: 17, scope: !69)
!87 = !DILocation(line: 37, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !69, file: !13, line: 37, column: 9)
!89 = !DILocation(line: 37, column: 14, scope: !88)
!90 = !DILocation(line: 37, column: 21, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !13, line: 37, column: 9)
!92 = !DILocation(line: 37, column: 25, scope: !91)
!93 = !DILocation(line: 37, column: 23, scope: !91)
!94 = !DILocation(line: 37, column: 9, scope: !88)
!95 = !DILocation(line: 39, column: 23, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !13, line: 38, column: 9)
!97 = !DILocation(line: 39, column: 28, scope: !96)
!98 = !DILocation(line: 39, column: 18, scope: !96)
!99 = !DILocation(line: 39, column: 13, scope: !96)
!100 = !DILocation(line: 39, column: 21, scope: !96)
!101 = !DILocation(line: 40, column: 9, scope: !96)
!102 = !DILocation(line: 37, column: 35, scope: !91)
!103 = !DILocation(line: 37, column: 9, scope: !91)
!104 = distinct !{!104, !94, !105, !106}
!105 = !DILocation(line: 40, column: 9, scope: !88)
!106 = !{!"llvm.loop.mustprogress"}
!107 = !DILocation(line: 41, column: 9, scope: !69)
!108 = !DILocation(line: 41, column: 21, scope: !69)
!109 = !DILocation(line: 42, column: 19, scope: !69)
!110 = !DILocation(line: 42, column: 9, scope: !69)
!111 = !DILocation(line: 43, column: 14, scope: !69)
!112 = !DILocation(line: 43, column: 9, scope: !69)
!113 = !DILocation(line: 45, column: 1, scope: !64)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !13, line: 88, type: !6)
!116 = !DILocation(line: 88, column: 12, scope: !114)
!117 = !DILocation(line: 89, column: 10, scope: !114)
!118 = !DILocation(line: 91, column: 20, scope: !114)
!119 = !DILocation(line: 91, column: 10, scope: !114)
!120 = !DILocation(line: 92, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !13, line: 92, column: 9)
!122 = !DILocation(line: 92, column: 14, scope: !121)
!123 = !DILocation(line: 92, column: 9, scope: !114)
!124 = !DILocation(line: 92, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !13, line: 92, column: 23)
!126 = !DILocation(line: 93, column: 12, scope: !114)
!127 = !DILocation(line: 93, column: 5, scope: !114)
!128 = !DILocation(line: 94, column: 5, scope: !114)
!129 = !DILocation(line: 94, column: 17, scope: !114)
!130 = !DILocation(line: 95, column: 63, scope: !114)
!131 = !DILocation(line: 95, column: 61, scope: !114)
!132 = !DILocation(line: 96, column: 5, scope: !114)
!133 = !DILocation(line: 97, column: 1, scope: !114)
!134 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 65, type: !21, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DILocalVariable(name: "data", scope: !134, file: !13, line: 67, type: !6)
!136 = !DILocation(line: 67, column: 12, scope: !134)
!137 = !DILocation(line: 67, column: 19, scope: !134)
!138 = !DILocalVariable(name: "i", scope: !139, file: !13, line: 69, type: !70)
!139 = distinct !DILexicalBlock(scope: !134, file: !13, line: 68, column: 5)
!140 = !DILocation(line: 69, column: 16, scope: !139)
!141 = !DILocalVariable(name: "destLen", scope: !139, file: !13, line: 69, type: !70)
!142 = !DILocation(line: 69, column: 19, scope: !139)
!143 = !DILocalVariable(name: "dest", scope: !139, file: !13, line: 70, type: !77)
!144 = !DILocation(line: 70, column: 14, scope: !139)
!145 = !DILocation(line: 71, column: 9, scope: !139)
!146 = !DILocation(line: 72, column: 9, scope: !139)
!147 = !DILocation(line: 72, column: 21, scope: !139)
!148 = !DILocation(line: 73, column: 26, scope: !139)
!149 = !DILocation(line: 73, column: 19, scope: !139)
!150 = !DILocation(line: 73, column: 17, scope: !139)
!151 = !DILocation(line: 76, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !139, file: !13, line: 76, column: 9)
!153 = !DILocation(line: 76, column: 14, scope: !152)
!154 = !DILocation(line: 76, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !13, line: 76, column: 9)
!156 = !DILocation(line: 76, column: 25, scope: !155)
!157 = !DILocation(line: 76, column: 23, scope: !155)
!158 = !DILocation(line: 76, column: 9, scope: !152)
!159 = !DILocation(line: 78, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !13, line: 77, column: 9)
!161 = !DILocation(line: 78, column: 28, scope: !160)
!162 = !DILocation(line: 78, column: 18, scope: !160)
!163 = !DILocation(line: 78, column: 13, scope: !160)
!164 = !DILocation(line: 78, column: 21, scope: !160)
!165 = !DILocation(line: 79, column: 9, scope: !160)
!166 = !DILocation(line: 76, column: 35, scope: !155)
!167 = !DILocation(line: 76, column: 9, scope: !155)
!168 = distinct !{!168, !158, !169, !106}
!169 = !DILocation(line: 79, column: 9, scope: !152)
!170 = !DILocation(line: 80, column: 9, scope: !139)
!171 = !DILocation(line: 80, column: 21, scope: !139)
!172 = !DILocation(line: 81, column: 19, scope: !139)
!173 = !DILocation(line: 81, column: 9, scope: !139)
!174 = !DILocation(line: 82, column: 14, scope: !139)
!175 = !DILocation(line: 82, column: 9, scope: !139)
!176 = !DILocation(line: 84, column: 1, scope: !134)
