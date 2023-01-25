; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx2, align 1, !dbg !39
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay3, i8** %data, align 8, !dbg !41
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !42
  %1 = load i8*, i8** %data, align 8, !dbg !43
  call void %0(i8* %1), !dbg !42
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx, align 1, !dbg !60
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !62
  store i64 %call, i64* %destLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !67
  %1 = load i64, i64* %destLen, align 8, !dbg !69
  %cmp = icmp ult i64 %0, %1, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !72
  %3 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !72
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !72
  %5 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !76
  store i8 %4, i8* %arrayidx3, align 1, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %6, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx4, align 1, !dbg !85
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay5), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_44_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__char_declare_loop_44_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__char_declare_loop_44_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !114, metadata !DIExpression()), !dbg !115
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !120
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx2, align 1, !dbg !125
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  store i8* %arraydecay3, i8** %data, align 8, !dbg !127
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !128
  %1 = load i8*, i8** %data, align 8, !dbg !129
  call void %0(i8* %1), !dbg !128
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !131 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx, align 1, !dbg !143
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !145
  store i64 %call, i64* %destLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !150
  %1 = load i64, i64* %destLen, align 8, !dbg !152
  %cmp = icmp ult i64 %0, %1, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !155
  %3 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !155
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !155
  %5 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !159
  store i8 %4, i8* %arrayidx3, align 1, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %6, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !166
  store i8 0, i8* %arrayidx4, align 1, !dbg !167
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !168
  call void @printLine(i8* %arraydecay5), !dbg !169
  ret void, !dbg !170
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_44_bad", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 44, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 44, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 46, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 46, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 47, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 47, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 48, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 48, column: 10, scope: !11)
!34 = !DILocation(line: 49, column: 5, scope: !11)
!35 = !DILocation(line: 50, column: 5, scope: !11)
!36 = !DILocation(line: 50, column: 25, scope: !11)
!37 = !DILocation(line: 51, column: 5, scope: !11)
!38 = !DILocation(line: 52, column: 5, scope: !11)
!39 = !DILocation(line: 52, column: 27, scope: !11)
!40 = !DILocation(line: 54, column: 12, scope: !11)
!41 = !DILocation(line: 54, column: 10, scope: !11)
!42 = !DILocation(line: 56, column: 5, scope: !11)
!43 = !DILocation(line: 56, column: 13, scope: !11)
!44 = !DILocation(line: 57, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !12, line: 23, type: !16)
!47 = !DILocation(line: 23, column: 28, scope: !45)
!48 = !DILocalVariable(name: "i", scope: !49, file: !12, line: 26, type: !50)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 25, column: 5)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 26, column: 16, scope: !49)
!54 = !DILocalVariable(name: "destLen", scope: !49, file: !12, line: 26, type: !50)
!55 = !DILocation(line: 26, column: 19, scope: !49)
!56 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 27, type: !30)
!57 = !DILocation(line: 27, column: 14, scope: !49)
!58 = !DILocation(line: 28, column: 9, scope: !49)
!59 = !DILocation(line: 29, column: 9, scope: !49)
!60 = !DILocation(line: 29, column: 21, scope: !49)
!61 = !DILocation(line: 30, column: 26, scope: !49)
!62 = !DILocation(line: 30, column: 19, scope: !49)
!63 = !DILocation(line: 30, column: 17, scope: !49)
!64 = !DILocation(line: 33, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !49, file: !12, line: 33, column: 9)
!66 = !DILocation(line: 33, column: 14, scope: !65)
!67 = !DILocation(line: 33, column: 21, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !12, line: 33, column: 9)
!69 = !DILocation(line: 33, column: 25, scope: !68)
!70 = !DILocation(line: 33, column: 23, scope: !68)
!71 = !DILocation(line: 33, column: 9, scope: !65)
!72 = !DILocation(line: 35, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !12, line: 34, column: 9)
!74 = !DILocation(line: 35, column: 28, scope: !73)
!75 = !DILocation(line: 35, column: 18, scope: !73)
!76 = !DILocation(line: 35, column: 13, scope: !73)
!77 = !DILocation(line: 35, column: 21, scope: !73)
!78 = !DILocation(line: 36, column: 9, scope: !73)
!79 = !DILocation(line: 33, column: 35, scope: !68)
!80 = !DILocation(line: 33, column: 9, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 36, column: 9, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 37, column: 9, scope: !49)
!85 = !DILocation(line: 37, column: 21, scope: !49)
!86 = !DILocation(line: 38, column: 19, scope: !49)
!87 = !DILocation(line: 38, column: 9, scope: !49)
!88 = !DILocation(line: 40, column: 1, scope: !45)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_44_good", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 100, column: 5, scope: !89)
!91 = !DILocation(line: 101, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 112, type: !93, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !95, !96}
!95 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 112, type: !95)
!98 = !DILocation(line: 112, column: 14, scope: !92)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 112, type: !96)
!100 = !DILocation(line: 112, column: 27, scope: !92)
!101 = !DILocation(line: 115, column: 22, scope: !92)
!102 = !DILocation(line: 115, column: 12, scope: !92)
!103 = !DILocation(line: 115, column: 5, scope: !92)
!104 = !DILocation(line: 117, column: 5, scope: !92)
!105 = !DILocation(line: 118, column: 5, scope: !92)
!106 = !DILocation(line: 119, column: 5, scope: !92)
!107 = !DILocation(line: 122, column: 5, scope: !92)
!108 = !DILocation(line: 123, column: 5, scope: !92)
!109 = !DILocation(line: 124, column: 5, scope: !92)
!110 = !DILocation(line: 126, column: 5, scope: !92)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 85, type: !16)
!113 = !DILocation(line: 85, column: 12, scope: !111)
!114 = !DILocalVariable(name: "funcPtr", scope: !111, file: !12, line: 86, type: !20)
!115 = !DILocation(line: 86, column: 12, scope: !111)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !12, line: 87, type: !25)
!117 = !DILocation(line: 87, column: 10, scope: !111)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !12, line: 88, type: !30)
!119 = !DILocation(line: 88, column: 10, scope: !111)
!120 = !DILocation(line: 89, column: 5, scope: !111)
!121 = !DILocation(line: 90, column: 5, scope: !111)
!122 = !DILocation(line: 90, column: 25, scope: !111)
!123 = !DILocation(line: 91, column: 5, scope: !111)
!124 = !DILocation(line: 92, column: 5, scope: !111)
!125 = !DILocation(line: 92, column: 27, scope: !111)
!126 = !DILocation(line: 94, column: 12, scope: !111)
!127 = !DILocation(line: 94, column: 10, scope: !111)
!128 = !DILocation(line: 95, column: 5, scope: !111)
!129 = !DILocation(line: 95, column: 13, scope: !111)
!130 = !DILocation(line: 96, column: 1, scope: !111)
!131 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 64, type: !21, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", arg: 1, scope: !131, file: !12, line: 64, type: !16)
!133 = !DILocation(line: 64, column: 32, scope: !131)
!134 = !DILocalVariable(name: "i", scope: !135, file: !12, line: 67, type: !50)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 66, column: 5)
!136 = !DILocation(line: 67, column: 16, scope: !135)
!137 = !DILocalVariable(name: "destLen", scope: !135, file: !12, line: 67, type: !50)
!138 = !DILocation(line: 67, column: 19, scope: !135)
!139 = !DILocalVariable(name: "dest", scope: !135, file: !12, line: 68, type: !30)
!140 = !DILocation(line: 68, column: 14, scope: !135)
!141 = !DILocation(line: 69, column: 9, scope: !135)
!142 = !DILocation(line: 70, column: 9, scope: !135)
!143 = !DILocation(line: 70, column: 21, scope: !135)
!144 = !DILocation(line: 71, column: 26, scope: !135)
!145 = !DILocation(line: 71, column: 19, scope: !135)
!146 = !DILocation(line: 71, column: 17, scope: !135)
!147 = !DILocation(line: 74, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !135, file: !12, line: 74, column: 9)
!149 = !DILocation(line: 74, column: 14, scope: !148)
!150 = !DILocation(line: 74, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 74, column: 9)
!152 = !DILocation(line: 74, column: 25, scope: !151)
!153 = !DILocation(line: 74, column: 23, scope: !151)
!154 = !DILocation(line: 74, column: 9, scope: !148)
!155 = !DILocation(line: 76, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !12, line: 75, column: 9)
!157 = !DILocation(line: 76, column: 28, scope: !156)
!158 = !DILocation(line: 76, column: 18, scope: !156)
!159 = !DILocation(line: 76, column: 13, scope: !156)
!160 = !DILocation(line: 76, column: 21, scope: !156)
!161 = !DILocation(line: 77, column: 9, scope: !156)
!162 = !DILocation(line: 74, column: 35, scope: !151)
!163 = !DILocation(line: 74, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165, !83}
!165 = !DILocation(line: 77, column: 9, scope: !148)
!166 = !DILocation(line: 78, column: 9, scope: !135)
!167 = !DILocation(line: 78, column: 21, scope: !135)
!168 = !DILocation(line: 79, column: 19, scope: !135)
!169 = !DILocation(line: 79, column: 9, scope: !135)
!170 = !DILocation(line: 81, column: 1, scope: !131)
