; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_04.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_04_bad() #0 !dbg !11 {
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
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay3, i8** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !41
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx5, align 1, !dbg !44
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %0 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !48
  %mul = mul i64 %call, 1, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !45
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx8, align 1, !dbg !51
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @printLine(i8* %arraydecay9), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_04_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #8, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #8, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__char_declare_memcpy_04_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__char_declare_memcpy_04_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !85
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !88
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx2, align 1, !dbg !90
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i8* %arraydecay3, i8** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !98
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx5, align 1, !dbg !100
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !104
  %mul = mul i64 %call, 1, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !101
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx8, align 1, !dbg !107
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @printLine(i8* %arraydecay9), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !118
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !121
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx2, align 1, !dbg !123
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !124
  store i8* %arraydecay3, i8** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx5, align 1, !dbg !133
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !134
  %0 = load i8*, i8** %data, align 8, !dbg !135
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !137
  %mul = mul i64 %call, 1, !dbg !138
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !134
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx8, align 1, !dbg !140
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @printLine(i8* %arraydecay9), !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 32, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 33, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 34, column: 10, scope: !11)
!29 = !DILocation(line: 35, column: 5, scope: !11)
!30 = !DILocation(line: 36, column: 5, scope: !11)
!31 = !DILocation(line: 36, column: 25, scope: !11)
!32 = !DILocation(line: 37, column: 5, scope: !11)
!33 = !DILocation(line: 38, column: 5, scope: !11)
!34 = !DILocation(line: 38, column: 27, scope: !11)
!35 = !DILocation(line: 42, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !12, line: 40, column: 5)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 8)
!38 = !DILocation(line: 42, column: 14, scope: !36)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 45, type: !25)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 44, column: 5)
!41 = !DILocation(line: 45, column: 14, scope: !40)
!42 = !DILocation(line: 46, column: 9, scope: !40)
!43 = !DILocation(line: 47, column: 9, scope: !40)
!44 = !DILocation(line: 47, column: 21, scope: !40)
!45 = !DILocation(line: 50, column: 9, scope: !40)
!46 = !DILocation(line: 50, column: 22, scope: !40)
!47 = !DILocation(line: 50, column: 35, scope: !40)
!48 = !DILocation(line: 50, column: 28, scope: !40)
!49 = !DILocation(line: 50, column: 40, scope: !40)
!50 = !DILocation(line: 51, column: 9, scope: !40)
!51 = !DILocation(line: 51, column: 21, scope: !40)
!52 = !DILocation(line: 52, column: 19, scope: !40)
!53 = !DILocation(line: 52, column: 9, scope: !40)
!54 = !DILocation(line: 54, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_04_good", scope: !12, file: !12, line: 119, type: !13, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 121, column: 5, scope: !55)
!57 = !DILocation(line: 122, column: 5, scope: !55)
!58 = !DILocation(line: 123, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !60, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 135, type: !62)
!65 = !DILocation(line: 135, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 135, type: !63)
!67 = !DILocation(line: 135, column: 27, scope: !59)
!68 = !DILocation(line: 138, column: 22, scope: !59)
!69 = !DILocation(line: 138, column: 12, scope: !59)
!70 = !DILocation(line: 138, column: 5, scope: !59)
!71 = !DILocation(line: 140, column: 5, scope: !59)
!72 = !DILocation(line: 141, column: 5, scope: !59)
!73 = !DILocation(line: 142, column: 5, scope: !59)
!74 = !DILocation(line: 145, column: 5, scope: !59)
!75 = !DILocation(line: 146, column: 5, scope: !59)
!76 = !DILocation(line: 147, column: 5, scope: !59)
!77 = !DILocation(line: 149, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 63, type: !16)
!80 = !DILocation(line: 63, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 64, type: !20)
!82 = !DILocation(line: 64, column: 10, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 65, type: !25)
!84 = !DILocation(line: 65, column: 10, scope: !78)
!85 = !DILocation(line: 66, column: 5, scope: !78)
!86 = !DILocation(line: 67, column: 5, scope: !78)
!87 = !DILocation(line: 67, column: 25, scope: !78)
!88 = !DILocation(line: 68, column: 5, scope: !78)
!89 = !DILocation(line: 69, column: 5, scope: !78)
!90 = !DILocation(line: 69, column: 27, scope: !78)
!91 = !DILocation(line: 78, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !12, line: 76, column: 5)
!93 = distinct !DILexicalBlock(scope: !78, file: !12, line: 70, column: 8)
!94 = !DILocation(line: 78, column: 14, scope: !92)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !12, line: 81, type: !25)
!96 = distinct !DILexicalBlock(scope: !78, file: !12, line: 80, column: 5)
!97 = !DILocation(line: 81, column: 14, scope: !96)
!98 = !DILocation(line: 82, column: 9, scope: !96)
!99 = !DILocation(line: 83, column: 9, scope: !96)
!100 = !DILocation(line: 83, column: 21, scope: !96)
!101 = !DILocation(line: 86, column: 9, scope: !96)
!102 = !DILocation(line: 86, column: 22, scope: !96)
!103 = !DILocation(line: 86, column: 35, scope: !96)
!104 = !DILocation(line: 86, column: 28, scope: !96)
!105 = !DILocation(line: 86, column: 40, scope: !96)
!106 = !DILocation(line: 87, column: 9, scope: !96)
!107 = !DILocation(line: 87, column: 21, scope: !96)
!108 = !DILocation(line: 88, column: 19, scope: !96)
!109 = !DILocation(line: 88, column: 9, scope: !96)
!110 = !DILocation(line: 90, column: 1, scope: !78)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 95, type: !16)
!113 = !DILocation(line: 95, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !12, line: 96, type: !20)
!115 = !DILocation(line: 96, column: 10, scope: !111)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !12, line: 97, type: !25)
!117 = !DILocation(line: 97, column: 10, scope: !111)
!118 = !DILocation(line: 98, column: 5, scope: !111)
!119 = !DILocation(line: 99, column: 5, scope: !111)
!120 = !DILocation(line: 99, column: 25, scope: !111)
!121 = !DILocation(line: 100, column: 5, scope: !111)
!122 = !DILocation(line: 101, column: 5, scope: !111)
!123 = !DILocation(line: 101, column: 27, scope: !111)
!124 = !DILocation(line: 105, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !126, file: !12, line: 103, column: 5)
!126 = distinct !DILexicalBlock(scope: !111, file: !12, line: 102, column: 8)
!127 = !DILocation(line: 105, column: 14, scope: !125)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !12, line: 108, type: !25)
!129 = distinct !DILexicalBlock(scope: !111, file: !12, line: 107, column: 5)
!130 = !DILocation(line: 108, column: 14, scope: !129)
!131 = !DILocation(line: 109, column: 9, scope: !129)
!132 = !DILocation(line: 110, column: 9, scope: !129)
!133 = !DILocation(line: 110, column: 21, scope: !129)
!134 = !DILocation(line: 113, column: 9, scope: !129)
!135 = !DILocation(line: 113, column: 22, scope: !129)
!136 = !DILocation(line: 113, column: 35, scope: !129)
!137 = !DILocation(line: 113, column: 28, scope: !129)
!138 = !DILocation(line: 113, column: 40, scope: !129)
!139 = !DILocation(line: 114, column: 9, scope: !129)
!140 = !DILocation(line: 114, column: 21, scope: !129)
!141 = !DILocation(line: 115, column: 19, scope: !129)
!142 = !DILocation(line: 115, column: 9, scope: !129)
!143 = !DILocation(line: 117, column: 1, scope: !111)
