; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !38
  store i8* %6, i8** %data, align 8, !dbg !39
  %7 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !40
  %8 = load i8*, i8** %data, align 8, !dbg !41
  call void %7(i8* %8), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx, align 1, !dbg !61
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !63
  store i64 %call, i64* %destLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !68
  %1 = load i64, i64* %destLen, align 8, !dbg !70
  %cmp = icmp ult i64 %0, %1, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !73
  %3 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !73
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !73
  %5 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !77
  store i8 %4, i8* %arrayidx3, align 1, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %6, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx4, align 1, !dbg !86
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !87
  call void @printLine(i8* %arraydecay5), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_44_good() #0 !dbg !90 {
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
  call void @CWE126_Buffer_Overread__char_alloca_loop_44_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__char_alloca_loop_44_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !115, metadata !DIExpression()), !dbg !116
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 50, align 16, !dbg !119
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %1 = alloca i8, i64 100, align 16, !dbg !122
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !121
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !124
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !128
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !129
  store i8 0, i8* %arrayidx1, align 1, !dbg !130
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !131
  store i8* %6, i8** %data, align 8, !dbg !132
  %7 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !133
  %8 = load i8*, i8** %data, align 8, !dbg !134
  call void %7(i8* %8), !dbg !133
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !136 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !146
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !148
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !149
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !150
  store i64 %call, i64* %destLen, align 8, !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !155
  %1 = load i64, i64* %destLen, align 8, !dbg !157
  %cmp = icmp ult i64 %0, %1, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !160
  %3 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !160
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !160
  %5 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !164
  store i8 %4, i8* %arrayidx3, align 1, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %6, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !171
  store i8 0, i8* %arrayidx4, align 1, !dbg !172
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !173
  call void @printLine(i8* %arraydecay5), !dbg !174
  ret void, !dbg !175
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_44_bad", scope: !14, file: !14, line: 42, type: !15, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_44.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 44, type: !4)
!18 = !DILocation(line: 44, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 46, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 46, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 47, type: !4)
!25 = !DILocation(line: 47, column: 12, scope: !13)
!26 = !DILocation(line: 47, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 48, type: !4)
!28 = !DILocation(line: 48, column: 12, scope: !13)
!29 = !DILocation(line: 48, column: 37, scope: !13)
!30 = !DILocation(line: 49, column: 12, scope: !13)
!31 = !DILocation(line: 49, column: 5, scope: !13)
!32 = !DILocation(line: 50, column: 5, scope: !13)
!33 = !DILocation(line: 50, column: 25, scope: !13)
!34 = !DILocation(line: 51, column: 12, scope: !13)
!35 = !DILocation(line: 51, column: 5, scope: !13)
!36 = !DILocation(line: 52, column: 5, scope: !13)
!37 = !DILocation(line: 52, column: 27, scope: !13)
!38 = !DILocation(line: 54, column: 12, scope: !13)
!39 = !DILocation(line: 54, column: 10, scope: !13)
!40 = !DILocation(line: 56, column: 5, scope: !13)
!41 = !DILocation(line: 56, column: 13, scope: !13)
!42 = !DILocation(line: 57, column: 1, scope: !13)
!43 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !14, line: 23, type: !4)
!45 = !DILocation(line: 23, column: 28, scope: !43)
!46 = !DILocalVariable(name: "i", scope: !47, file: !14, line: 26, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !14, line: 25, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 26, column: 16, scope: !47)
!52 = !DILocalVariable(name: "destLen", scope: !47, file: !14, line: 26, type: !48)
!53 = !DILocation(line: 26, column: 19, scope: !47)
!54 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 27, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 27, column: 14, scope: !47)
!59 = !DILocation(line: 28, column: 9, scope: !47)
!60 = !DILocation(line: 29, column: 9, scope: !47)
!61 = !DILocation(line: 29, column: 21, scope: !47)
!62 = !DILocation(line: 30, column: 26, scope: !47)
!63 = !DILocation(line: 30, column: 19, scope: !47)
!64 = !DILocation(line: 30, column: 17, scope: !47)
!65 = !DILocation(line: 33, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !47, file: !14, line: 33, column: 9)
!67 = !DILocation(line: 33, column: 14, scope: !66)
!68 = !DILocation(line: 33, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !14, line: 33, column: 9)
!70 = !DILocation(line: 33, column: 25, scope: !69)
!71 = !DILocation(line: 33, column: 23, scope: !69)
!72 = !DILocation(line: 33, column: 9, scope: !66)
!73 = !DILocation(line: 35, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !14, line: 34, column: 9)
!75 = !DILocation(line: 35, column: 28, scope: !74)
!76 = !DILocation(line: 35, column: 18, scope: !74)
!77 = !DILocation(line: 35, column: 13, scope: !74)
!78 = !DILocation(line: 35, column: 21, scope: !74)
!79 = !DILocation(line: 36, column: 9, scope: !74)
!80 = !DILocation(line: 33, column: 35, scope: !69)
!81 = !DILocation(line: 33, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 36, column: 9, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 37, column: 9, scope: !47)
!86 = !DILocation(line: 37, column: 21, scope: !47)
!87 = !DILocation(line: 38, column: 19, scope: !47)
!88 = !DILocation(line: 38, column: 9, scope: !47)
!89 = !DILocation(line: 40, column: 1, scope: !43)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_44_good", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 100, column: 5, scope: !90)
!92 = !DILocation(line: 101, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 112, type: !94, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!96, !96, !97}
!96 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !14, line: 112, type: !96)
!99 = !DILocation(line: 112, column: 14, scope: !93)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !14, line: 112, type: !97)
!101 = !DILocation(line: 112, column: 27, scope: !93)
!102 = !DILocation(line: 115, column: 22, scope: !93)
!103 = !DILocation(line: 115, column: 12, scope: !93)
!104 = !DILocation(line: 115, column: 5, scope: !93)
!105 = !DILocation(line: 117, column: 5, scope: !93)
!106 = !DILocation(line: 118, column: 5, scope: !93)
!107 = !DILocation(line: 119, column: 5, scope: !93)
!108 = !DILocation(line: 122, column: 5, scope: !93)
!109 = !DILocation(line: 123, column: 5, scope: !93)
!110 = !DILocation(line: 124, column: 5, scope: !93)
!111 = !DILocation(line: 126, column: 5, scope: !93)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !14, line: 85, type: !4)
!114 = !DILocation(line: 85, column: 12, scope: !112)
!115 = !DILocalVariable(name: "funcPtr", scope: !112, file: !14, line: 86, type: !20)
!116 = !DILocation(line: 86, column: 12, scope: !112)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !14, line: 87, type: !4)
!118 = !DILocation(line: 87, column: 12, scope: !112)
!119 = !DILocation(line: 87, column: 36, scope: !112)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !14, line: 88, type: !4)
!121 = !DILocation(line: 88, column: 12, scope: !112)
!122 = !DILocation(line: 88, column: 37, scope: !112)
!123 = !DILocation(line: 89, column: 12, scope: !112)
!124 = !DILocation(line: 89, column: 5, scope: !112)
!125 = !DILocation(line: 90, column: 5, scope: !112)
!126 = !DILocation(line: 90, column: 25, scope: !112)
!127 = !DILocation(line: 91, column: 12, scope: !112)
!128 = !DILocation(line: 91, column: 5, scope: !112)
!129 = !DILocation(line: 92, column: 5, scope: !112)
!130 = !DILocation(line: 92, column: 27, scope: !112)
!131 = !DILocation(line: 94, column: 12, scope: !112)
!132 = !DILocation(line: 94, column: 10, scope: !112)
!133 = !DILocation(line: 95, column: 5, scope: !112)
!134 = !DILocation(line: 95, column: 13, scope: !112)
!135 = !DILocation(line: 96, column: 1, scope: !112)
!136 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 64, type: !21, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", arg: 1, scope: !136, file: !14, line: 64, type: !4)
!138 = !DILocation(line: 64, column: 32, scope: !136)
!139 = !DILocalVariable(name: "i", scope: !140, file: !14, line: 67, type: !48)
!140 = distinct !DILexicalBlock(scope: !136, file: !14, line: 66, column: 5)
!141 = !DILocation(line: 67, column: 16, scope: !140)
!142 = !DILocalVariable(name: "destLen", scope: !140, file: !14, line: 67, type: !48)
!143 = !DILocation(line: 67, column: 19, scope: !140)
!144 = !DILocalVariable(name: "dest", scope: !140, file: !14, line: 68, type: !55)
!145 = !DILocation(line: 68, column: 14, scope: !140)
!146 = !DILocation(line: 69, column: 9, scope: !140)
!147 = !DILocation(line: 70, column: 9, scope: !140)
!148 = !DILocation(line: 70, column: 21, scope: !140)
!149 = !DILocation(line: 71, column: 26, scope: !140)
!150 = !DILocation(line: 71, column: 19, scope: !140)
!151 = !DILocation(line: 71, column: 17, scope: !140)
!152 = !DILocation(line: 74, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !140, file: !14, line: 74, column: 9)
!154 = !DILocation(line: 74, column: 14, scope: !153)
!155 = !DILocation(line: 74, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !14, line: 74, column: 9)
!157 = !DILocation(line: 74, column: 25, scope: !156)
!158 = !DILocation(line: 74, column: 23, scope: !156)
!159 = !DILocation(line: 74, column: 9, scope: !153)
!160 = !DILocation(line: 76, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !14, line: 75, column: 9)
!162 = !DILocation(line: 76, column: 28, scope: !161)
!163 = !DILocation(line: 76, column: 18, scope: !161)
!164 = !DILocation(line: 76, column: 13, scope: !161)
!165 = !DILocation(line: 76, column: 21, scope: !161)
!166 = !DILocation(line: 77, column: 9, scope: !161)
!167 = !DILocation(line: 74, column: 35, scope: !156)
!168 = !DILocation(line: 74, column: 9, scope: !156)
!169 = distinct !{!169, !159, !170, !84}
!170 = !DILocation(line: 77, column: 9, scope: !153)
!171 = !DILocation(line: 78, column: 9, scope: !140)
!172 = !DILocation(line: 78, column: 21, scope: !140)
!173 = !DILocation(line: 79, column: 19, scope: !140)
!174 = !DILocation(line: 79, column: 9, scope: !140)
!175 = !DILocation(line: 81, column: 1, scope: !136)
