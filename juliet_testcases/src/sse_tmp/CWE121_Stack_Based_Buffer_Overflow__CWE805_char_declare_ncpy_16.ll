; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  br label %while.body, !dbg !29

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %while.end, !dbg !35

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx2, align 1, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay3, i64 99) #5, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !45
  store i8 0, i8* %arrayidx4, align 1, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %3), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  br label %while.body, !dbg !79

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !80
  store i8* %arraydecay, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  br label %while.end, !dbg !85

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !89
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx2, align 1, !dbg !91
  %1 = load i8*, i8** %data, align 8, !dbg !92
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !93
  %call = call i8* @strncpy(i8* %1, i8* %arraydecay3, i64 99) #5, !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !95
  store i8 0, i8* %arrayidx4, align 1, !dbg !96
  %3 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* %3), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16.c", directory: "/root/SSE-Assessment")
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
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 14, scope: !31)
!33 = !DILocation(line: 33, column: 9, scope: !31)
!34 = !DILocation(line: 33, column: 17, scope: !31)
!35 = !DILocation(line: 34, column: 9, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 37, type: !25)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!38 = !DILocation(line: 37, column: 14, scope: !37)
!39 = !DILocation(line: 38, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 9, scope: !37)
!41 = !DILocation(line: 39, column: 23, scope: !37)
!42 = !DILocation(line: 41, column: 17, scope: !37)
!43 = !DILocation(line: 41, column: 23, scope: !37)
!44 = !DILocation(line: 41, column: 9, scope: !37)
!45 = !DILocation(line: 42, column: 9, scope: !37)
!46 = !DILocation(line: 42, column: 21, scope: !37)
!47 = !DILocation(line: 43, column: 19, scope: !37)
!48 = !DILocation(line: 43, column: 9, scope: !37)
!49 = !DILocation(line: 45, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_16_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 77, column: 5, scope: !50)
!52 = !DILocation(line: 78, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !54, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 90, type: !56)
!59 = !DILocation(line: 90, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 90, type: !57)
!61 = !DILocation(line: 90, column: 27, scope: !53)
!62 = !DILocation(line: 93, column: 22, scope: !53)
!63 = !DILocation(line: 93, column: 12, scope: !53)
!64 = !DILocation(line: 93, column: 5, scope: !53)
!65 = !DILocation(line: 95, column: 5, scope: !53)
!66 = !DILocation(line: 96, column: 5, scope: !53)
!67 = !DILocation(line: 97, column: 5, scope: !53)
!68 = !DILocation(line: 100, column: 5, scope: !53)
!69 = !DILocation(line: 101, column: 5, scope: !53)
!70 = !DILocation(line: 102, column: 5, scope: !53)
!71 = !DILocation(line: 104, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 54, type: !16)
!74 = !DILocation(line: 54, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !12, line: 55, type: !20)
!76 = !DILocation(line: 55, column: 10, scope: !72)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !12, line: 56, type: !25)
!78 = !DILocation(line: 56, column: 10, scope: !72)
!79 = !DILocation(line: 57, column: 5, scope: !72)
!80 = !DILocation(line: 60, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !12, line: 58, column: 5)
!82 = !DILocation(line: 60, column: 14, scope: !81)
!83 = !DILocation(line: 61, column: 9, scope: !81)
!84 = !DILocation(line: 61, column: 17, scope: !81)
!85 = !DILocation(line: 62, column: 9, scope: !81)
!86 = !DILocalVariable(name: "source", scope: !87, file: !12, line: 65, type: !25)
!87 = distinct !DILexicalBlock(scope: !72, file: !12, line: 64, column: 5)
!88 = !DILocation(line: 65, column: 14, scope: !87)
!89 = !DILocation(line: 66, column: 9, scope: !87)
!90 = !DILocation(line: 67, column: 9, scope: !87)
!91 = !DILocation(line: 67, column: 23, scope: !87)
!92 = !DILocation(line: 69, column: 17, scope: !87)
!93 = !DILocation(line: 69, column: 23, scope: !87)
!94 = !DILocation(line: 69, column: 9, scope: !87)
!95 = !DILocation(line: 70, column: 9, scope: !87)
!96 = !DILocation(line: 70, column: 21, scope: !87)
!97 = !DILocation(line: 71, column: 19, scope: !87)
!98 = !DILocation(line: 71, column: 9, scope: !87)
!99 = !DILocation(line: 73, column: 1, scope: !72)
