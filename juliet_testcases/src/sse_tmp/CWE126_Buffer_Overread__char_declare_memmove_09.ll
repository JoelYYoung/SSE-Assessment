; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_09.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay3, i8** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx5, align 1, !dbg !47
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %1 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !51
  %mul = mul i64 %call, 1, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !48
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx8, align 1, !dbg !54
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay9), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_09_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #8, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #8, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__char_declare_memmove_09_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__char_declare_memmove_09_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !88
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !91
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !92
  store i8 0, i8* %arrayidx2, align 1, !dbg !93
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !94
  %tobool = icmp ne i32 %0, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i8* %arraydecay3, i8** %data, align 8, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx5, align 1, !dbg !108
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  %1 = load i8*, i8** %data, align 8, !dbg !110
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !112
  %mul = mul i64 %call, 1, !dbg !113
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !109
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx8, align 1, !dbg !115
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  call void @printLine(i8* %arraydecay9), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !126
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !129
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx2, align 1, !dbg !131
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !132
  %tobool = icmp ne i32 %0, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !135
  store i8* %arraydecay3, i8** %data, align 8, !dbg !137
  br label %if.end, !dbg !138

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !139, metadata !DIExpression()), !dbg !141
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !142
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !143
  store i8 0, i8* %arrayidx5, align 1, !dbg !144
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  %1 = load i8*, i8** %data, align 8, !dbg !146
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !148
  %mul = mul i64 %call, 1, !dbg !149
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !145
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !150
  store i8 0, i8* %arrayidx8, align 1, !dbg !151
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !152
  call void @printLine(i8* %arraydecay9), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_09_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_09.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 32, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!37 = !DILocation(line: 32, column: 8, scope: !11)
!38 = !DILocation(line: 35, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 35, column: 14, scope: !39)
!41 = !DILocation(line: 36, column: 5, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !12, line: 38, type: !25)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!44 = !DILocation(line: 38, column: 14, scope: !43)
!45 = !DILocation(line: 39, column: 9, scope: !43)
!46 = !DILocation(line: 40, column: 9, scope: !43)
!47 = !DILocation(line: 40, column: 21, scope: !43)
!48 = !DILocation(line: 43, column: 9, scope: !43)
!49 = !DILocation(line: 43, column: 23, scope: !43)
!50 = !DILocation(line: 43, column: 36, scope: !43)
!51 = !DILocation(line: 43, column: 29, scope: !43)
!52 = !DILocation(line: 43, column: 41, scope: !43)
!53 = !DILocation(line: 44, column: 9, scope: !43)
!54 = !DILocation(line: 44, column: 21, scope: !43)
!55 = !DILocation(line: 45, column: 19, scope: !43)
!56 = !DILocation(line: 45, column: 9, scope: !43)
!57 = !DILocation(line: 47, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_09_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 114, column: 5, scope: !58)
!60 = !DILocation(line: 115, column: 5, scope: !58)
!61 = !DILocation(line: 116, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !63, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 128, type: !65)
!68 = !DILocation(line: 128, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 128, type: !66)
!70 = !DILocation(line: 128, column: 27, scope: !62)
!71 = !DILocation(line: 131, column: 22, scope: !62)
!72 = !DILocation(line: 131, column: 12, scope: !62)
!73 = !DILocation(line: 131, column: 5, scope: !62)
!74 = !DILocation(line: 133, column: 5, scope: !62)
!75 = !DILocation(line: 134, column: 5, scope: !62)
!76 = !DILocation(line: 135, column: 5, scope: !62)
!77 = !DILocation(line: 138, column: 5, scope: !62)
!78 = !DILocation(line: 139, column: 5, scope: !62)
!79 = !DILocation(line: 140, column: 5, scope: !62)
!80 = !DILocation(line: 142, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 56, type: !16)
!83 = !DILocation(line: 56, column: 12, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 57, type: !20)
!85 = !DILocation(line: 57, column: 10, scope: !81)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 58, type: !25)
!87 = !DILocation(line: 58, column: 10, scope: !81)
!88 = !DILocation(line: 59, column: 5, scope: !81)
!89 = !DILocation(line: 60, column: 5, scope: !81)
!90 = !DILocation(line: 60, column: 25, scope: !81)
!91 = !DILocation(line: 61, column: 5, scope: !81)
!92 = !DILocation(line: 62, column: 5, scope: !81)
!93 = !DILocation(line: 62, column: 27, scope: !81)
!94 = !DILocation(line: 63, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !81, file: !12, line: 63, column: 8)
!96 = !DILocation(line: 63, column: 8, scope: !81)
!97 = !DILocation(line: 66, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 64, column: 5)
!99 = !DILocation(line: 67, column: 5, scope: !98)
!100 = !DILocation(line: 71, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !12, line: 69, column: 5)
!102 = !DILocation(line: 71, column: 14, scope: !101)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !12, line: 74, type: !25)
!104 = distinct !DILexicalBlock(scope: !81, file: !12, line: 73, column: 5)
!105 = !DILocation(line: 74, column: 14, scope: !104)
!106 = !DILocation(line: 75, column: 9, scope: !104)
!107 = !DILocation(line: 76, column: 9, scope: !104)
!108 = !DILocation(line: 76, column: 21, scope: !104)
!109 = !DILocation(line: 79, column: 9, scope: !104)
!110 = !DILocation(line: 79, column: 23, scope: !104)
!111 = !DILocation(line: 79, column: 36, scope: !104)
!112 = !DILocation(line: 79, column: 29, scope: !104)
!113 = !DILocation(line: 79, column: 41, scope: !104)
!114 = !DILocation(line: 80, column: 9, scope: !104)
!115 = !DILocation(line: 80, column: 21, scope: !104)
!116 = !DILocation(line: 81, column: 19, scope: !104)
!117 = !DILocation(line: 81, column: 9, scope: !104)
!118 = !DILocation(line: 83, column: 1, scope: !81)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !12, line: 88, type: !16)
!121 = !DILocation(line: 88, column: 12, scope: !119)
!122 = !DILocalVariable(name: "dataBadBuffer", scope: !119, file: !12, line: 89, type: !20)
!123 = !DILocation(line: 89, column: 10, scope: !119)
!124 = !DILocalVariable(name: "dataGoodBuffer", scope: !119, file: !12, line: 90, type: !25)
!125 = !DILocation(line: 90, column: 10, scope: !119)
!126 = !DILocation(line: 91, column: 5, scope: !119)
!127 = !DILocation(line: 92, column: 5, scope: !119)
!128 = !DILocation(line: 92, column: 25, scope: !119)
!129 = !DILocation(line: 93, column: 5, scope: !119)
!130 = !DILocation(line: 94, column: 5, scope: !119)
!131 = !DILocation(line: 94, column: 27, scope: !119)
!132 = !DILocation(line: 95, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !119, file: !12, line: 95, column: 8)
!134 = !DILocation(line: 95, column: 8, scope: !119)
!135 = !DILocation(line: 98, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 96, column: 5)
!137 = !DILocation(line: 98, column: 14, scope: !136)
!138 = !DILocation(line: 99, column: 5, scope: !136)
!139 = !DILocalVariable(name: "dest", scope: !140, file: !12, line: 101, type: !25)
!140 = distinct !DILexicalBlock(scope: !119, file: !12, line: 100, column: 5)
!141 = !DILocation(line: 101, column: 14, scope: !140)
!142 = !DILocation(line: 102, column: 9, scope: !140)
!143 = !DILocation(line: 103, column: 9, scope: !140)
!144 = !DILocation(line: 103, column: 21, scope: !140)
!145 = !DILocation(line: 106, column: 9, scope: !140)
!146 = !DILocation(line: 106, column: 23, scope: !140)
!147 = !DILocation(line: 106, column: 36, scope: !140)
!148 = !DILocation(line: 106, column: 29, scope: !140)
!149 = !DILocation(line: 106, column: 41, scope: !140)
!150 = !DILocation(line: 107, column: 9, scope: !140)
!151 = !DILocation(line: 107, column: 21, scope: !140)
!152 = !DILocation(line: 108, column: 19, scope: !140)
!153 = !DILocation(line: 108, column: 9, scope: !140)
!154 = !DILocation(line: 110, column: 1, scope: !119)
