; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_67b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType = type { i8* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType, align 8
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType, %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType, %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !36
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %1, i64 %call) #7, !dbg !37
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx4, align 1, !dbg !39
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @printLine(i8* %arraydecay5), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_ncpy_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !43 {
entry:
  %myStruct = alloca %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType, align 8
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType, %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType* %myStruct, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data, metadata !46, metadata !DIExpression()), !dbg !47
  %structFirst = getelementptr inbounds %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType, %struct._CWE127_Buffer_Underread__malloc_char_ncpy_67_structType* %myStruct, i32 0, i32 0, !dbg !48
  %0 = load i8*, i8** %structFirst, align 8, !dbg !48
  store i8* %0, i8** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %1 = load i8*, i8** %data, align 8, !dbg !56
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !58
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %1, i64 %call) #7, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx4, align 1, !dbg !61
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay5), !dbg !63
  ret void, !dbg !64
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_67b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_ncpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__malloc_char_ncpy_67_structType", file: !10, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE127_Buffer_Underread__malloc_char_ncpy_67_structType", file: !10, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 28, type: !13)
!20 = !DILocation(line: 28, column: 116, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !17)
!22 = !DILocation(line: 30, column: 12, scope: !9)
!23 = !DILocation(line: 30, column: 28, scope: !9)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 32, column: 14, scope: !25)
!30 = !DILocation(line: 33, column: 9, scope: !25)
!31 = !DILocation(line: 34, column: 9, scope: !25)
!32 = !DILocation(line: 34, column: 21, scope: !25)
!33 = !DILocation(line: 36, column: 17, scope: !25)
!34 = !DILocation(line: 36, column: 23, scope: !25)
!35 = !DILocation(line: 36, column: 36, scope: !25)
!36 = !DILocation(line: 36, column: 29, scope: !25)
!37 = !DILocation(line: 36, column: 9, scope: !25)
!38 = !DILocation(line: 38, column: 9, scope: !25)
!39 = !DILocation(line: 38, column: 21, scope: !25)
!40 = !DILocation(line: 39, column: 19, scope: !25)
!41 = !DILocation(line: 39, column: 9, scope: !25)
!42 = !DILocation(line: 43, column: 1, scope: !9)
!43 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_ncpy_67b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "myStruct", arg: 1, scope: !43, file: !10, line: 50, type: !13)
!45 = !DILocation(line: 50, column: 120, scope: !43)
!46 = !DILocalVariable(name: "data", scope: !43, file: !10, line: 52, type: !17)
!47 = !DILocation(line: 52, column: 12, scope: !43)
!48 = !DILocation(line: 52, column: 28, scope: !43)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !10, line: 54, type: !26)
!50 = distinct !DILexicalBlock(scope: !43, file: !10, line: 53, column: 5)
!51 = !DILocation(line: 54, column: 14, scope: !50)
!52 = !DILocation(line: 55, column: 9, scope: !50)
!53 = !DILocation(line: 56, column: 9, scope: !50)
!54 = !DILocation(line: 56, column: 21, scope: !50)
!55 = !DILocation(line: 58, column: 17, scope: !50)
!56 = !DILocation(line: 58, column: 23, scope: !50)
!57 = !DILocation(line: 58, column: 36, scope: !50)
!58 = !DILocation(line: 58, column: 29, scope: !50)
!59 = !DILocation(line: 58, column: 9, scope: !50)
!60 = !DILocation(line: 60, column: 9, scope: !50)
!61 = !DILocation(line: 60, column: 21, scope: !50)
!62 = !DILocation(line: 61, column: 19, scope: !50)
!63 = !DILocation(line: 61, column: 9, scope: !50)
!64 = !DILocation(line: 65, column: 1, scope: !43)
